require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  context 'GET' do
    it 'should do index success' do
      get :index
      response.should have_http_status(:ok)
    end

    it 'should get book success' do
      book = FactoryGirl.create(:book)
      get :show, id: book.id
      response.should have_http_status(:ok)
    end

    it 'should not be success for no book id' do
      book = FactoryGirl.create(:book)
      get :show, id: ''
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'POST' do
    it 'should post book successfully' do
      book = FactoryGirl.create(:book)
      post :create, book: {name: book.name, isbn:book.isbn, author:book.author, price:book.price, publication:book.publication, version:book.version, library_id:book.library_id, category_id:book.category_id, issue_history_id:book.issue_history_id }
      response.should have_http_status(:ok)
    end

    it 'should not post book successfully' do
      book = FactoryGirl.create(:book)
      post :create, book: {name: book.name, isbn:book.isbn, author:book.author, price:book.price, publication:book.publication, version:book.version, library_id:'23', category_id:'32123', issue_history_id: '1223' }
      response.should have_http_status(:unprocessable_entity)
    end

    it 'should not post book success for no entries' do
      post :create, book: {name: '', isbn: '', author: '', price: '', publication: '', version: '', library_id: '', category_id: '', issue_history_id: '' }
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'PUT' do
    it 'should update book successfully' do
      book = FactoryGirl.create(:book)
      put :update, id: book.id, book: { name: book.name, isbn:book.isbn, author:book.author, price:book.price, publication:book.publication, version:book.version }
      response.should have_http_status(:ok)
    end

    it 'should not update book successfully when reference is wrong' do
      book = FactoryGirl.create(:book)
      put :update, id: book.id, book: { name: book.name, isbn:book.isbn, author:book.author, price:book.price, publication:book.publication, version:book.version, library_id:'23', category_id:'32123', issue_history_id: '1223'}
      response.should have_http_status(:unprocessable_entity)
    end


    it 'should not book successfully for empty data' do
      book = FactoryGirl.create(:book)
      put :update, id: book.id, book: { name: '', isbn: '', author: '', price: '', publication: '', version: '', library_id: '', category_id: '', issue_history_id: '' }
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'DELETE' do
    it ' should delete book successfully' do
      book = FactoryGirl.create(:book)
      delete :destroy, id: book.id
      response.should have_http_status(:ok)
    end

    it 'should not  delete book successfully for empty id' do
      book = FactoryGirl.create(:book)
      delete :destroy, id: ''
      response.should have_http_status(:unprocessable_entity)
    end
  end
end
