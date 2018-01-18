require 'rails_helper'

RSpec.describe IssueHistory, type: :model do
  context 'validation test' do
    it 'is valid issue_history Object' do
      FactoryGirl.build(:issue_history).should be_valid
    end

    it 'should validate book_id presence true' do
      FactoryGirl.build(:issue_history, book_id: nil).should_not be_valid
    end

    it 'should validate book_id presence true' do
      FactoryGirl.build(:issue_history, date_of_issue: nil).should_not be_valid
    end    

    it 'should validate book_id presence true' do
      FactoryGirl.build(:issue_history, date_of_return: nil).should_not be_valid
    end    

    it 'should validate book_id presence true' do
      FactoryGirl.build(:issue_history, status: nil).should_not be_valid
    end    

    it 'should validate book_id presence true' do
      FactoryGirl.build(:issue_history, copies: nil).should_not be_valid
    end    
  end

  context 'assosiation test' do
    it 'should belongs to member' do
      member = FactoryGirl.create(:member)
      issue_history = FactoryGirl.create(:issue_history, member_id: member.id)
      issue_history.member_id.should eq member.id
    end

    it 'should not belongs to invalid member' do
      member1 = FactoryGirl.create(:member)
      member2 = FactoryGirl.create(:member)
      issue_history = FactoryGirl.create(:issue_history, member_id: member1.id)
      issue_history.member_id.should eq member1.id
      issue_history.member_id.should_not eq member2.id
    end

    it 'should has many books' do
      issue_history = FactoryGirl.create(:issue_history)
      book1 = FactoryGirl.create(:book, issue_history_id: issue_history.id)
      book2 = FactoryGirl.create(:book, issue_history_id: issue_history.id)
      book1.issue_history_id.should eq issue_history.id
      book2.issue_history_id.should eq issue_history.id
    end

    it 'should not has invalid books' do
      issue_history1 = FactoryGirl.create(:issue_history)
      issue_history2 = FactoryGirl.create(:issue_history)
      book1 = FactoryGirl.create(:book, issue_history_id: issue_history1.id)
      book2 = FactoryGirl.create(:book, issue_history_id: issue_history2.id)
      book1.issue_history_id.should eq issue_history1.id
      book1.issue_history_id.should_not eq issue_history2.id
      book2.issue_history_id.should eq issue_history2.id
      book2.issue_history_id.should_not eq issue_history1.id
    end
  end
end
