require 'rails_helper'

RSpec.describe MembersController, type: :controller do
context 'GET' do
    it 'all success' do
      get :index, format: 'json'
      response.should have_http_status(:ok)
    end

    it 'member success' do
      member = FactoryGirl.create(:member)
      get :show, id: member.id, format: 'json'
      response.should have_http_status(:ok)
    end

    it 'member not success' do
      member = FactoryGirl.create(:member)
      get :show, id: '', format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'POST' do
    it 'member success' do
      member = FactoryGirl.create(:member)
      post :create, member: { name:member.name, address:member.address, phone:member.phone, gender:'male', code: '3', validity_date: '2019-01-11', is_author: 'true', library_id: member.library_id }, format: 'json'
      response.should have_http_status(:ok)
    end

    it 'member not success' do
      member = FactoryGirl.create(:member)
      post :create, member: { name:'', address:'', phone:'', gender:'', code: '', validity_date: '', is_author: '', library_id: '' }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'PUT' do
    it 'member success' do
      member = FactoryGirl.create(:member)
      put :update, id: member.id, member: { name:member.name, address:member.address, phone:member.phone, gender:'male', code: '3', validity_date: '2019-01-11', is_author: 'true' }, format: 'json'
      response.should have_http_status(:ok)
    end

    it 'member not success' do
      member = FactoryGirl.create(:member)
      put :update, id: member.id, member: {  name:'', address:'', phone:'', gender:'', code: '', validity_date: '', is_author: '' }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'DELETE' do
    it 'member success' do
      member = FactoryGirl.create(:member)
      delete :destroy, id: member.id, format: 'json'
      response.should have_http_status(:ok)
    end

    it 'member not success' do
      member = FactoryGirl.create(:member)
      delete :destroy, id: '', format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
end
