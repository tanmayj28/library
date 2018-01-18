require 'rails_helper'

RSpec.describe Member, type: :model do
  context 'validation test' do
    it 'is valid member Object' do
      FactoryGirl.build(:member).should be_valid
    end

    it 'should validate phone length not more than 15' do
      FactoryGirl.build(:member, phone: '123456789123456789').should_not be_valid
    end

    it 'should validate phone length not less than 10' do
      FactoryGirl.build(:member, phone: '123456').should_not be_valid
    end

    it 'should validate phone presence true' do
      FactoryGirl.build(:member, phone: nil).should_not be_valid
    end

    it 'should validate name presence true' do
      FactoryGirl.build(:member, name: nil).should_not be_valid
    end

    it 'should validate address presence true' do
      FactoryGirl.build(:member, address: nil).should_not be_valid
    end

    it 'should validate code presence true' do
      FactoryGirl.build(:member, code: nil).should_not be_valid
    end

    it 'should validate gender presence true' do
      FactoryGirl.build(:member, gender: nil).should_not be_valid
    end

    it 'should validate validity date presence true' do
      FactoryGirl.build(:member, validity_date: nil).should_not be_valid
    end

    it 'should validate member is author boolean presence true' do
      FactoryGirl.build(:member, is_author: nil).should_not be_valid
    end
  end

  context 'assosiation test' do
    it 'should belongs to library' do
      library = FactoryGirl.create(:library)
      member = FactoryGirl.create(:member, library_id: library.id)
      member.library_id.should eq library.id
    end

    it 'should not belongs to invalid library' do
      library1 = FactoryGirl.create(:library)
      library2 = FactoryGirl.create(:library)
      member = FactoryGirl.create(:member, library_id: library1.id)
      member.library_id.should eq library1.id
      member.library_id.should_not eq library2.id
    end

    it 'should has many issue_history' do
      member = FactoryGirl.create(:member)
      issue_history1 = FactoryGirl.create(:issue_history, member_id: member.id)
      issue_history2 = FactoryGirl.create(:issue_history, member_id: member.id)
      issue_history1.member_id.should eq member.id
      issue_history2.member_id.should eq member.id
    end

    it 'should not has uninclded issue_histories' do
      member1 = FactoryGirl.create(:member)
      member2 = FactoryGirl.create(:member)
      issue_history1 = FactoryGirl.create(:issue_history, member_id: member1.id)
      issue_history2 = FactoryGirl.create(:issue_history, member_id: member2.id)
      issue_history1.member_id.should eq member1.id
      issue_history1.member_id.should_not eq member2.id
      issue_history2.member_id.should eq member2.id
      issue_history2.member_id.should_not eq member1.id
    end
  end
end
