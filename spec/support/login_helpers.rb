module LoginHelpers

  def login_with(user)
    visit new_user_session_path
    fill_in "user_username", with: user.username
    fill_in "user_password", with: 'pwd12345'
    click_button "Sign In"
  end

end
