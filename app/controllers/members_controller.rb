class MembersController < ApplicationController
  def index
    respond_to do |format|
      @members = Member.all
      format.json { render json: {members: @members}, status: :ok }
    end
  end

  def create
  	respond_to do |format|
      begin 
        @member = Member.new(member_params)
   	    if @member.save 
          format.json { render json: {member: @member}, status: :ok }
       	else
          format.json { render json: {member: @member.errors}, status: :unprocessable_entity }
        end
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
      end
   	end
  end

  def show
  	respond_to do |format|
      begin
      	@member = Member.find(params[:id])
        format.json { render json: {member: @member}, status: :ok }
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
      end
    end
  end

  def update
  	respond_to do |format|
      begin 
        @member = Member.find(params[:id])
        if @member.update(member_params)
          format.json { render json: {member: @member}, status: :ok }
        else
          format.json { render json: {member: @member.errors}, status: :unprocessable_entity }
        end
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
      end
  	end
  end

  def destroy
  	respond_to do |format|
	    begin 
	  	  @member = Member.find(params[:id])
	  	  if @member.destroy
       	  format.json { render json: {mesage: "Deleted!"}, status: :ok }
        else
          format.json { render json: {member: @member.errors}, status: :unprocessable_entity }
        end
      rescue => e
        format.json { render json: {message: e.message}, status: :unprocessable_entity }
      end
    end
  end

  private
  
  def member_params
 	  params.require(:member).permit(:name, :address, :phone, :gender, :code, :validity_date, :is_author, :library_id)
  end
end