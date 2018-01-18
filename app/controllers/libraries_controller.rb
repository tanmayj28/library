class LibrariesController < ApplicationController
  def index
  	respond_to do |format|
      @libraries = Library.all
      format.json { render json: {libraries: @libraries}, status: :ok }
    end
  end

  def create
  	respond_to do |format|
      begin 
        @library = Library.new(library_params)
   	    if @library.save 
          format.json { render json: {library: @library}, status: :ok }
       	else
          format.json { render json: {library: @library.errors}, status: :unprocessable_entity }
        end
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
      end
   	end
  end

  def show
  	respond_to do |format|
      begin
      	@library = Library.find(params[:id])
        format.json { render json: {library: @library}, status: :ok }
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
      end
    end
  end

  def update
  	respond_to do |format|
      begin 
        @library = Library.find(params[:id])
        if @library.update(library_params)
          format.json { render json: {library: @library}, status: :ok }
        else
          format.json { render json: {library: @library.errors}, status: :unprocessable_entity }
        end
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
      end
  	end
  end

  def destroy
  	respond_to do |format|
	    begin 
	  	  @library = Library.find(params[:id])
	  	  if @library.destroy
       	  format.json { render json: {mesage: "Deleted!"}, status: :ok }
        else
          format.json { render json: {library: @library.errors}, status: :unprocessable_entity }
        end
      rescue => e
        format.json { render json: {message: e.message}, status: :unprocessable_entity }
      end
    end
  end

  private
  
  def library_params
 	  params.require(:library).permit(:name, :address, :phone)
  end
end
