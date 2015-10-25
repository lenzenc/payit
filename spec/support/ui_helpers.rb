module UIHelpers

  def click_logout

    find_link("Logout", href: destroy_user_session_path).click

  end

end
