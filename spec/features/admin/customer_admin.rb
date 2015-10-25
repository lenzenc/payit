feature 'Customer Admin', feature: true do

  let(:user) { create :user }
  before { login_with user }

  scenario "admin user wants to display a current list of customers" do
    click_customers_top_nav
    expect(current_path).to eq(admin_customers_path)
    expect(page).to have_content(user.customer.name)
    expect(page).to have_content(user.customer.domain)
    expect(page).to have_link('add_customer', href: new_admin_customer_path)
  end

  context "during customer creation" do

    before { navigate_to_new_customer_page }

    scenario "admin user enters invalid customer data" do
      within customer_form do
        expect{click_button 'save_customer'}.to change{Customer.count}.by(0)
      end
      expect(page).to have_content('Please fix the errors below.')
      expect(current_path).to eq(admin_customers_path)
    end

    scenario "admin user enters valid customer data" do
      within customer_form do
        fill_in 'customer_name', with: 'Customer A'
        fill_in 'customer_domain', with: 'customera.com'
        expect{click_button 'save_customer'}.to change{Customer.count}.by(1)
      end
      expect(current_path).to eq(admin_customers_path)
      expect(page).to have_content('Customer A')
      expect(page).to have_content('customera.com')
    end

  end

  private

  def click_customers_top_nav
    find_link('customer_admin', href: admin_customers_path).click
  end

  def click_add_customer
    find_link('add_customer', href: new_admin_customer_path).click
  end

  def navigate_to_new_customer_page
    click_customers_top_nav
    click_add_customer
  end

  def customer_form
    find_by_id 'new_customer'
  end

end
