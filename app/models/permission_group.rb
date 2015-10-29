class PermissionGroup < ActiveRecord::Base

  has_many :permissions
  has_and_belongs_to_many :feature_modules

  validates :code, presence: true, length: { maximum: 20 }, uniqueness: true
  validates :name, presence: true, length: { maximum: 100 }, uniqueness: true

end
