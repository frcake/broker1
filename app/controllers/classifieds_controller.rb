class ClassifiedsController < ApplicationController

	
	#before_action :require_user, only: [:index, :show]





	def image_urls
		@classified = Classified.find(params[:id])
		@photos = @classified.photos
	end


	def new 
		@classified = Classified.new
	#@photo = @classified.photos.build
		respond_to do |format|
	  		format.html # new.html.erb
	  		format.json { render json: @classified }
		end
	end

	def index
		@search = Classified.search do 

			fulltext params[:search]

		end
		@classified = @search.results

		#@classified = Classified.all

		respond_to do |format|
	      format.html # index.html.erb
	      format.json { render json: @classifieds }
	  end

			#See rails casts for more options /278/
			#@classified = Classified.all
		end

		def show 
			@classified = Classified.find(params[:id])
			@photos = @classified.photos #CW

			@image_urls=[]

			@classified.photos.each do |photo|

			@image_urls.push(photo.image.url)

			end


			respond_to do |format|
	      format.html # show.html.erb
	      format.json { render json: @classified }
	  end
	end


	def edit
		@classified = Classified.find(params[:id])

	end

	def update
		@classified = Classified.find(params[:id])

		if @classified.update_attributes(classified_params)

			if params[:images]
	          # The magic is here ;)
	          params[:images].each { |image|
	          	@classified.photos.create(image: image)
	          }
	          
	      end
	      redirect_to :back 
	     # format.html { redirect_to @classified, notice: 'Classified was successfully updated.' }
	     # format.json { head :no_content }
	 else
	 	format.html { render action: "edit" }
	 	format.json { render json: @classified.errors, status: :unprocessable_entity }
	 end
	end

	def destroy
		@classified = Classified.find(params[:id])
		if @classified.destroy
			redirect_to :back
		end

		#respond_to do |format|
		#	format.html { redirect_to classifieds_url }
		#	format.json { head :no_content }
		#end
	end

	def create

		@classified = Classified.new(classified_params)
		@classified.user_id = current_user.id


		if @classified.save
			if params[:images]
	          # The magic is here ;)
	          params[:images].each { |image|
	          	@classified.photos.create(image: image)
	          }
	      end
	      redirect_to @classified
	        #format.html { redirect_to @classified, notice: 'Classified was successfully created.' }
	        #format.json { render json: @classified, status: :created, location: @classified }
	    else
	    	format.html { render action: "new" }
	    	format.json { render json: @classified.errors, status: :unprocessable_entity }
	    end		


	end



	def favorite
		type = params[:type]
		@classified = Classified.find(params[:id])
		if type == "favorite"
			current_user.favorites << @classified
	      	redirect_to :back#, notice: 'You favorited #{@classified.title}'

	  elsif type == "unfavorite"
	  	current_user.favorites.delete(@classified)
	      redirect_to :back#, notice: 'Unfavorited #{@classified.title}'

	  else
	      # Type missing, nothing happens
	      redirect_to :back#, notice: 'Nothing happened.'
	  end
	end




	private


	def classified_params
		params.require(:classified).permit(:make ,:model,:year,:color,:title,:condition,:price,:offer,:make_country	,:category	,:description , :category_id,:photos)
	end
end


