class Permission < ActiveRecord::Base

  belongs_to :permission_group

  validates :code, presence: true, length: { maximum: 20 }, uniqueness: true
  validates :name, presence: true, length: { maximum: 100 }, uniqueness: true

end
