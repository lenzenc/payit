module ApplicationHelper

  def user_name
    t('global.user_name', :first_name => current_user.first_name, :last_name => current_user.last_name)
  end

end
