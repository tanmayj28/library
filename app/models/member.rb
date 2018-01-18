class Member < ActiveRecord::Base
  belongs_to :library
  has_many :issue_histories
  enum gender: [ :male, :female]
  validates :phone, length: {in: 10..15}
  validates :name, :address, :gender, :phone, :code, :validity_date, :is_author, :library_id, presence: true
end