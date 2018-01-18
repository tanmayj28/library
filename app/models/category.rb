class Category < ActiveRecord::Base
  has_many :books
  validates :category_name, presence: true
end
