class Library < ActiveRecord::Base
  has_many :members
  has_many :books
  validates :phone, length: {in: 10..15}
  validates :name, :address, :phone, presence: true
end