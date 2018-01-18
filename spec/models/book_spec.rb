require 'rails_helper'

RSpec.describe Book, type: :model do
  context 'validation test' do
    it 'is valid book' do
      FactoryGirl.build(:book).should be_valid
    end

    it 'validates phone length more than 15' do
      FactoryGirl.build(:book, isbn: nil).should_not be_valid
    end

    it 'validates phone length less than 10' do
      FactoryGirl.build(:book, author: nil).should_not be_valid
    end

    it 'validates name presence true' do
      FactoryGirl.build(:book, library_id: nil).should_not be_valid
    end

    it 'validates phone presence true' do
      FactoryGirl.build(:book, category_id: nil).should_not be_valid
    end

    it 'validates age presence true' do
      FactoryGirl.build(:book, issue_history_id: nil).should_not be_valid
    end

    it 'validates invalid age' do
      FactoryGirl.build(:book, price: nil).should_not be_valid
    end 

    it 'validates invalid age' do
      FactoryGirl.build(:book, publication: nil).should_not be_valid
    end

    it 'validates invalid age' do
      FactoryGirl.build(:book, version: nil).should_not be_valid
    end
  end

  context 'assosiation test' do
    it 'should belongs to library' do
      library = FactoryGirl.create(:library)
      book = FactoryGirl.create(:book, library_id: library.id)
      book.library_id.should eq library.id
    end

    it 'should not belongs to invalid library' do
      library1 = FactoryGirl.create(:library)
      library2 = FactoryGirl.create(:library)
      book = FactoryGirl.create(:book, library_id: library1.id)
      book.library_id.should eq library1.id
      book.library_id.should_not eq library2.id
    end

    it 'should belongs to category' do
      category = FactoryGirl.create(:category)
      book = FactoryGirl.create(:book, category_id: category.id)
      book.category_id.should eq category.id
    end

    it 'should not belongs to invalid category' do
      category1 = FactoryGirl.create(:category)
      category2 = FactoryGirl.create(:category)
      book = FactoryGirl.create(:book, category_id: category1.id)
      book.category_id.should eq category1.id
      book.category_id.should_not eq category2.id
    end

    it 'should belongs to issue history' do
      issue_history = FactoryGirl.create(:issue_history)
      book = FactoryGirl.create(:book, issue_history_id: issue_history.id)
      book.issue_history_id.should eq issue_history.id
    end

    it 'should not belongs to invalid issue history' do
      issue_history1 = FactoryGirl.create(:issue_history)
      issue_history2 = FactoryGirl.create(:issue_history)
      book = FactoryGirl.create(:book, issue_history_id: issue_history1.id)
      book.issue_history_id.should eq issue_history1.id
      book.issue_history_id.should_not eq issue_history2.id
    end
  end
end
