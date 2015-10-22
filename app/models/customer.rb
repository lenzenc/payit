class Customer < ActiveRecord::Base

  validates :name, presence: true, length: { maximum: 100 }, uniqueness: true
  validates :domain, presence: true, length: { maximum: 100 }, uniqueness: true

end
