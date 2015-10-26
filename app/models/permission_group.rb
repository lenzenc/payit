class PermissionGroup < ActiveRecord::Base

  has_many :permissions

  validates :code, presence: true, length: { maximum: 20 }, uniqueness: true
  validates :name, presence: true, length: { maximum: 100 }, uniqueness: true

end
