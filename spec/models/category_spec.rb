require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'validation test' do
    it 'is valid category Object' do
      FactoryGirl.build(:category).should be_valid
    end

    it 'should validate category presence true' do
      FactoryGirl.build(:category, category_name: nil).should_not be_valid
    end
  end

  context 'assosiation test' do
    it 'should has many book' do
      category = FactoryGirl.create(:category)
      book1 = FactoryGirl.create(:book, category_id: category.id)
      book2 = FactoryGirl.create(:book, category_id: category.id)
      book1.category_id.should eq category.id
      book2.category_id.should eq category.id
    end

    it 'should not has invalid book' do
      category1 = FactoryGirl.create(:category)
      category2 = FactoryGirl.create(:category)
      book1 = FactoryGirl.create(:book, category_id: category1.id)
      book2 = FactoryGirl.create(:book, category_id: category2.id)
      book1.category_id.should eq category1.id
      book1.category_id.should_not eq category2.id
      book2.category_id.should eq category2.id
      book2.category_id.should_not eq category1.id
    end
  end 
end