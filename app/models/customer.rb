class Customer < ActiveRecord::Base

  validates :name, presence: true, length: { maximum: 100 }, uniqueness: true
  validates :domain, presence: true, length: { maximum: 100 }, uniqueness: true, format: { with: /.+\..+/i }

  DEFAULT_PWD = "payit123"

  def default_user
    User.new(
      first_name: 'PayIt',
      last_name: 'Admin',
      employee_id: 'payit.admin',
      email: "payitadmin@#{domain}",
      username: "payitadmin@#{domain}",
      password: DEFAULT_PWD,
      password_confirmation: DEFAULT_PWD,
      customer: self
    )
  end

end
