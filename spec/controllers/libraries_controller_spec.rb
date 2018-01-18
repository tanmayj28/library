require 'rails_helper'

RSpec.describe LibrariesController, type: :controller do
  context 'GET' do
    it 'all success' do
      get :index, format: 'json'
      response.should have_http_status(:ok)
    end

    it 'library success' do
      library = FactoryGirl.create(:library)
      get :show, id: library.id, format: 'json'
      response.should have_http_status(:ok)
    end

    it 'library not success' do
      library = FactoryGirl.create(:library)
      get :show, id: '', format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'POST' do
    it 'library success' do
      library = FactoryGirl.create(:library)
      post :create, library: { name:library.name , address:library.address, phone:library.phone }, format: 'json'
      response.should have_http_status(:ok)
    end

    it 'library not success' do
      library = FactoryGirl.create(:library)
      post :create, library: { name: '', address: '', phone: ''}, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'PUT' do
    it 'library success' do
      library = FactoryGirl.create(:library)
      put :update, id: library.id, library: { name:library.name , address:library.address, phone:library.phone }, format: 'json'
      response.should have_http_status(:ok)
    end

    it 'library not success' do
      library = FactoryGirl.create(:library)
      put :update, id: library.id, library: { name:'' , address:'', phone:'' }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'DELETE' do
    it 'library success' do
      library = FactoryGirl.create(:library)
      delete :destroy, id: library.id, format: 'json'
      response.should have_http_status(:ok)
    end

    it 'library not success' do
      library = FactoryGirl.create(:library)
      delete :destroy, id: '', format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
end
