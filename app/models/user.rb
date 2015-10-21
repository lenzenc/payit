class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :trackable, :validatable, :timeoutable, :lockable

  class << self

    def find_for_database_authentication(conditions)
      username = conditions[:username] || ''
      where(["lower(username) = :value", { :value => username }]).first
    end

  end

end
