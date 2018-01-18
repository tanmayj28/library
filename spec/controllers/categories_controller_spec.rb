require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  context 'GET' do
    it 'should do index success' do
      get :index, format: 'json'
      response.should have_http_status(:ok)
    end

    it 'should get category success' do
      category = FactoryGirl.create(:category)
      get :show, id: category.id, format: 'json'
      response.should have_http_status(:ok)
    end

    it 'should not be success for no category id' do
      category = FactoryGirl.create(:category)
      get :show, id: '', format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'POST' do
    it 'should post category successfully' do
      post :create, category: { category_name: 'A' }, format: 'json'
      response.should have_http_status(:ok)
    end

    it 'should not post category successfully for no entries' do
      post :create, category: { category_name: '' }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'PUT' do
    it 'should update category successfully' do
      category = FactoryGirl.create(:category)
      put :update, id: category.id, category: { category_name: category.category_name }, format: 'json'
      response.should have_http_status(:ok)
    end

    it 'should not category successfully for empty data' do
      category = FactoryGirl.create(:category)
      put :update, id: category.id, category: { category_name: '' }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'DELETE' do
    it 'should delete category successfully' do
      category = FactoryGirl.create(:category)
      delete :destroy, id: category.id, format: 'json'
      response.should have_http_status(:ok)
    end

    it 'should not  delete category successfully for empty id' do
      category = FactoryGirl.create(:category)
      delete :destroy, id: '', format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
end
