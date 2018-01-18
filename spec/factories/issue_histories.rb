FactoryGirl.define do
  factory :issue_history do
    date_of_issue '2018-01-11'
    date_of_return '2018-01-17'
    status 'rent'
    copies 1
    book_id 1
    association :member, factory: :member, strategy: :create
  end
end
