class IssueHistory < ActiveRecord::Base
  belongs_to :member
  has_many :books
  enum status: [ :rent, :return]
  validates :book_id, :date_of_issue, :date_of_return, :status, :member_id, :copies, presence: true
end