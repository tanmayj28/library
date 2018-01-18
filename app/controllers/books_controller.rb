class BooksController < ApplicationController
  def index 
    respond_to do |format|
      @books = Book.all
      format.json { render json: {books: @books}, status: :ok }
      format.html { render html: {books: @books}, status: :ok }
    end
  end

  def create
  	respond_to do |format|
      begin 
        @book = Book.new(book_params)
   	    if @book.save 
          format.json { render json: {book: @book}, status: :ok }
          format.html { render html: {book: @book}, status: :ok }
       	else
          format.json { render json: {book: @book.errors}, status: :unprocessable_entity }
          format.html { render html: {book: @book.errors}, status: :unprocessable_entity }
        end
      rescue => e
        format.html { render html: {error: e.message}, status: :unprocessable_entity }
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
      end
   	end
  end

  def show
  	respond_to do |format|
      begin
      	@book = Book.find(params[:id])
        format.json { render json: {book: @book}, status: :ok }
        format.html { render html: {book: @book}, status: :ok }
      rescue => e
        format.html { render html: {error: e.message}, status: :unprocessable_entity }
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
      end
    end
  end

  def update
  	respond_to do |format|
      begin 
        @book = Book.find(params[:id])
        if @book.update(book_params)
          format.html { render html: {book: @book}, status: :ok }
          format.json { render json: {book: @book}, status: :ok }
        else
          format.json { render json: {book: @book.errors}, status: :unprocessable_entity }
          format.html { render html: {book: @book.errors}, status: :unprocessable_entity }
        end
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
        format.html { render html: {error: e.message}, status: :unprocessable_entity }
      end
  	end
  end

  def destroy
  	respond_to do |format|
	    begin 
	  	  @book = Book.find(params[:id])
	  	  if @book.destroy
       	  format.json { render json: {mesage: "Deleted!"}, status: :ok }
          format.html { render html: {mesage: "Deleted!"}, status: :ok }
        else
          format.html { render html: {book: @book.errors}, status: :unprocessable_entity }
          format.json { render json: {book: @book.errors}, status: :unprocessable_entity }
        end
      rescue => e
        format.html { render html: {message: e.message}, status: :unprocessable_entity }
        format.json { render json: {message: e.message}, status: :unprocessable_entity }
      end
    end
  end

  private
  
  def book_params
 	  params.require(:book).permit(:name, :isbn, :author, :price, :publication, :version, :library_id, :category_id, :issue_history_id)
  end
end
