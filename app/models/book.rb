class Book < ActiveRecord::Base
  belongs_to :library
  belongs_to :category
  belongs_to :issue_history
  
  validates :name, :isbn, :author,:price, :publication, :version, :library_id, :category_id, :issue_history_id, presence: true
end
