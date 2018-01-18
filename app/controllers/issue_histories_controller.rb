class IssueHistoriesController < ApplicationController 
  def index
    respond_to do |format|
      @issue_histories = IssueHistory.all
      format.json { render json: {issue_histories: @issue_histories }, status: :ok }
    end
  end

  def create
  	respond_to do |format|
      begin 
        @issue_history = IssueHistory.new(issuehistory_params)
   	    if @issue_history.save 
          format.json { render json: {issue_history: @issue_history}, status: :ok }
       	else
          format.json { render json: {issue_history: @issue_history.errors}, status: :unprocessable_entity }
        end
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
      end
   	end
  end

  def show
  	respond_to do |format|
      begin
      	@issue_history = IssueHistory.find(params[:id])
        format.json { render json: {issue_history: @issue_history}, status: :ok }
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
      end
    end
  end

  def update
  	respond_to do |format|
      begin 
        @issue_history = IssueHistory.find(params[:id])
        if @issue_history.update(issuehistory_params)
          format.json { render json: {issue_history: @issue_history}, status: :ok }
        else
          format.json { render json: {issue_history: @issue_history.errors}, status: :unprocessable_entity }
        end
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
      end
  	end
  end

  def destroy
  	respond_to do |format|
	    begin 
	  	  @issue_history = IssueHistory.find(params[:id])
	  	  if @issue_history.destroy
       	  format.json { render json: {mesage: "Deleted!"}, status: :ok }
        else
          format.json { render json: {issue_history: @issue_history.errors}, status: :unprocessable_entity }
        end
      rescue => e
        format.json { render json: {message: e.message}, status: :unprocessable_entity }
      end
    end
  end

  private
  
  def issuehistory_params
 	  params.require(:issue_history).permit(:member_id, :book_id, :date_of_issue, :date_of_return, :status, :copies)
  end
end