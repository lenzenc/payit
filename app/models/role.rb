class Role < ActiveRecord::Base

  has_and_belongs_to_many :users
  has_and_belongs_to_many :permissions
  has_and_belongs_to_many :feature_modules

  validates :name, presence: true, length: { maximum: 100 }, uniqueness: true

end
