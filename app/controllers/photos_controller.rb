class PhotosController < ApplicationController

before_action :require_user, only: [:index, :show]


def destroy
		flash[:success] = "deleted"
		if Photo.find(params[:id]).destroy
			redirect_to '/'
		else
			redirect_to '/'
		end
	end


	def update
		@photo = Photo.find(params[:id])
	  
		if @photo.update_attributes(:id)
		  
	      redirect_to '/'
		else
		  render 'edit'
		end   
	end

end
