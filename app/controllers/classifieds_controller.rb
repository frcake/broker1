class ClassifiedsController < ApplicationController

	
	before_action :require_user, only: [:index, :show]


	def new 
		@classified = Classified.new
		@photo = @classified.photos.build
	end

	def index
		@search = Classified.search do 

			fulltext params[:search]
			
		end
		@classified = @search.results

		#See rails casts for more options /278/
		#@classified = Classified.all
	end

	def show 
		@classified = Classified.find(params[:id])
	end

	
	def edit
		@classified = Classified.find(params[:id])
		
	end

	def update
		@classified = Classified.find(params[:id])
	  
		if @classified.update_attributes(classified_params)
		  
	      redirect_to '/'
		else
		  render 'edit'
		end   
	end

	def destroy
		flash[:success] = "deleted"
		if Classified.find(params[:id]).destroy
			redirect_to '/'
		else
			redirect_to '/'
		end
	end

	def create

		@classified = Classified.new(classified_params)
		@classified.user_id = current_user.id


		if @classified.save
			redirect_to '/'
		else
			render 'create'
		end			

		
	end




private


	def classified_params
		params.require(:classified).permit(:make ,:model,:year,:color,:title,:condition,:price,:offer,:make_country	,:category	,:description , :category_id,:photos_attributes => [:id , :image  ]	)
	end
end


