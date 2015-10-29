class FeatureModule < ActiveRecord::Base

  has_and_belongs_to_many :customers
  has_and_belongs_to_many :roles
  has_and_belongs_to_many :permission_groups

  validates :code, presence: true, length: { maximum: 20 }, uniqueness: true

end
