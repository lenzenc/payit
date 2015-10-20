class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  protected

    def email_required?
      false
    end

    def email_changed?
      false
    end

    def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      login = conditions.delete(:username)
      where(conditions).where(["lower(username) = :value", { :value => login.downcase }]).first
    end

end
