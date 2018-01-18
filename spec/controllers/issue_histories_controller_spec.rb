require 'rails_helper'

RSpec.describe IssueHistoriesController, type: :controller do
  context 'GET' do
    it 'should do index success' do
      get :index, format: 'json'
      response.should have_http_status(:ok)
    end

    it 'should get issue history success' do
      issue_history = FactoryGirl.create(:issue_history)
      get :show, id: issue_history.id, format: 'json'
      response.should have_http_status(:ok)
    end

    it 'should not be success for no issue history id' do
      issue_history = FactoryGirl.create(:issue_history)
      get :show, id: '', format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'POST' do
    it 'should post issue history successfully' do
      issue_history = FactoryGirl.create(:issue_history)
      post :create, issue_history: { member_id: issue_history.member_id, book_id: issue_history.book_id, date_of_issue: '2018-01-11', date_of_return: '2018-01-19', status:'rent', copies:'2' }, format: 'json'
      response.should have_http_status(:ok)
    end

    it 'should not post issue_history for invalid foreign key ID' do
      issue_history = FactoryGirl.create(:issue_history)
      post :create, issue_history: { member_id: '123', book_id: '312', date_of_issue: '2018-01-11', date_of_return: '2018-01-19', status:'rent', copies:'2' }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end

    it 'should not post issue history successfully for no entries' do
      issue_history = FactoryGirl.create(:issue_history)
      post :create, issue_history: { member_id: '', book_id: '', date_of_issue: '', date_of_return: '', status:'', copies:'' }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'PUT' do
    it 'should update issue history successfully' do
      issue_history = FactoryGirl.create(:issue_history)
      put :update, id: issue_history.id, issue_history: { date_of_issue: '2018-01-11', date_of_return: '2018-01-19', status:'rent', copies:'2'}, format: 'json'
      response.should have_http_status(:ok)
    end

    it 'should not issue history successfully for empty data' do
      issue_history = FactoryGirl.create(:issue_history)
      put :update, id: issue_history.id, issue_history: { member_id: '', book_id: '', date_of_issue: '', date_of_return: '', status:'', copies:'' }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'DELETE' do
    it 'should delete issue history successfully' do
      issue_history = FactoryGirl.create(:issue_history)
      delete :destroy, id: issue_history.id, format: 'json'
      response.should have_http_status(:ok)
    end

    it 'should not  delete issue history successfully for empty id' do
      issue_history = FactoryGirl.create(:issue_history)
      delete :destroy, id: '', format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
end
