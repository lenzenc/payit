class Customer < ActiveRecord::Base

  validates :name, presence: true, length: { maximum: 100 }, uniqueness: true
  validates :domain, presence: true, length: { maximum: 100 }, uniqueness: true, format: { with: /.+\..+/i, message: :invalid_domain }

  DEFAULT_PWD = "payit123"

  def default_user
    User.new(
      first_name: 'PayIt',
      last_name: 'Admin',
      email: "payitadmin@#{domain}",
      username: "payitadmin@#{domain}",
      password: DEFAULT_PWD,
      password_confirmation: DEFAULT_PWD,
      customer: self
    )
  end

end
