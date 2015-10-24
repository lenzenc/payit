feature 'User login', feature: true do

  let(:user) { create :user }

  scenario "with invalid username and password" do
    login('invalid_username', 'invalid_password')
    expect(page).to have_content('Invalid username or password.')
  end

  scenario "with invalid username" do
    login('invalid_username', user.password)
    expect(page).to have_content('Invalid username or password.')
  end

  scenario "with invalid password" do
    login(user.username, 'invalid_password')
    expect(page).to have_content('Invalid username or password.')
  end

  scenario "with valid username and password" do
    login(user.username, user.password)
    expect(current_path).to eq root_path
  end

  private

  def login(username, password)
    visit new_user_session_path
    fill_in "user_username", with: username
    fill_in "user_password", with: password
    click_button "Sign In"
  end

end
