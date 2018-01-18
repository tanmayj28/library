require 'rails_helper'
 
RSpec.describe Library, type: :model do
  context 'validation test' do
    it 'should validate Complete Library Object' do
      FactoryGirl.build(:library).should be_valid
    end

    it 'should validate name presence true' do
      FactoryGirl.build(:library, name: nil).should_not be_valid
    end

    it 'should validate phone length more than 15' do
      FactoryGirl.build(:library, phone: '123456789123456789').should_not be_valid
    end

    it 'should validate phone presence true' do
      FactoryGirl.build(:library, phone: nil).should_not be_valid
    end
 
    it 'should validate phone length less than 10' do
      FactoryGirl.build(:library, phone: '123456').should_not be_valid
    end

    it 'validates invalid address' do
      FactoryGirl.build(:library, address: nil).should_not be_valid
    end
  end

  context 'assosiation test' do
    it 'should has many members' do
      library = FactoryGirl.create(:library)
      member1 = FactoryGirl.create(:member, library_id: library.id)
      member2 = FactoryGirl.create(:member, library_id: library.id)
      member1.library_id.should eq library.id
      member2.library_id.should eq library.id
    end

    it 'should has many books' do
      library = FactoryGirl.create(:library)
      book1 = FactoryGirl.create(:book, library_id: library.id)
      book2 = FactoryGirl.create(:book, library_id: library.id)
      book1.library_id.should eq library.id
      book2.library_id.should eq library.id
    end

    it 'should not has uninluded members' do
      library1 = FactoryGirl.create(:library)
      library2 = FactoryGirl.create(:library)
      member1 = FactoryGirl.create(:member, library_id: library1.id)
      member2 = FactoryGirl.create(:member, library_id: library2.id)
      member1.library_id.should eq library1.id
      member1.library_id.should_not eq library2.id
      member2.library_id.should eq library2.id
      member2.library_id.should_not eq library1.id
    end

    it 'should not has included books' do
      library1 = FactoryGirl.create(:library)
      library2 = FactoryGirl.create(:library)
      book1 = FactoryGirl.create(:book, library_id: library1.id)
      book2 = FactoryGirl.create(:book, library_id: library2.id)
      book1.library_id.should eq library1.id
      book1.library_id.should_not eq library2.id
      book2.library_id.should eq library2.id
      book2.library_id.should_not eq library1.id
    end
  end
end
