feature 'User Authentication', feature: true do

  let(:user) { create :user }

  scenario "when using an invalid username and password" do
    login('invalid_username', 'invalid_password')
    expect(page).to have_content('Invalid username or password.')
  end

  scenario "when using an invalid username" do
    login('invalid_username', user.password)
    expect(page).to have_content('Invalid username or password.')
  end

  scenario "when using an invalid password" do
    login(user.username, 'invalid_password')
    expect(page).to have_content('Invalid username or password.')
  end

  scenario "when using a valid username and password" do
    login(user.username, user.password)
    expect(current_path).to eq root_path
  end

  scenario "when prompted to login after trying to access a page other than the root path" do
    visit admin_customers_path
    expect(current_path).to eq(new_user_session_path)
    login(user.username, user.password)
    expect(current_path).to eq(admin_customers_path)
  end

  private

  def login(username, password)
    visit new_user_session_path
    fill_in "user_username", with: username
    fill_in "user_password", with: password
    click_button "Sign In"
  end

end
