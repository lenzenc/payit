class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :trackable, :validatable, :timeoutable, :lockable

  belongs_to :customer

  validates :first_name, presence: true, length: { maximum: 100 }
  validates :last_name, presence: true, length: { maximum: 100 }
  validates :employee_id, presence: true, length: { maximum: 100 }, uniqueness: { scope: :customer_id }
  validates :customer, presence: true

  class << self

    def find_for_database_authentication(conditions)
      username = conditions[:username] || ''
      where(["lower(username) = :value", { :value => username }]).first
    end

  end

end
