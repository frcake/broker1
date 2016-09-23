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
			paginate(:page => params[:page] || 1, :per_page => 10)
			order_by(:created_at , :desc)
			fulltext params[:search]
			with(:created_at)
			
			active_model = with(:model ,params[:model]) if params[:model].present?
			
			active_make = with(:make , params[:make]) if params[:make].present?
			
			active_make_country = with(:make_country , params[:make_country]) if params[:make_country].present?
			
			active_condition = with(:condition,params[:condition]) if params[:condition].present?

			active_category = with(:cat,params[:cat]) if params[:cat].present?

			facet(:model)	
			#facet(:model , exclude: active_condition)
			#facet(:model , exclude: active_make_country)
			#with(:model , params[:model]) if params[:model].present?
			
			#facet(:make , exclude: active_make )
			facet(:make)			
			#facet(:make , exclude: active_condition)
			#facet(:make , exclude: active_make_country)

			facet(:make_country)
			#facet(:make_country  , exclude: active_model)
			#facet(:make_country  , exclude: active_condition)
			#facet(:make_country  , exclude: active_make)

			facet(:condition)
			#facet(:condition , exclude: active_make)
			#facet(:condition , exclude: active_make_country)
			#facet(:condition , exclude: active_model)
			facet(:cat)
			#facet :make
			#with(:make , params[:make]) if params[:make].present?
			
			facet :created_month
			with(:created_month , params[:month]) if params[:month].present?
			
		end
		@classifieds = @search.results
		#@classifieds = Kaminari.paginate_array(@search.results).page(params[:page]).per(5)



		#@searchcat = Category.search do 
	 	#	facet :name
		#	with(:name , params[:name]) if params[:name].present?
		#end
		#@classified = @searchcat.results






		#@classified = Classified.all

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




	def sold 
		type = params[:type]
		@classified = Classified.find(params[:id])
		
		if type == "sold"
			@classified.update_attributes(:sold => true )	
			redirect_to :back	
		elsif type == "unsold"
			@classified.update_attributes(:sold => false )
			redirect_to :back
		end
	end


	def hold 
		type = params[:type]
		@classified = Classified.find(params[:id])
		
		if type == "hold"
			@classified.update_attributes(:hold => true )	
			redirect_to :back	
		elsif type == "unhold"
			@classified.update_attributes(:hold => false )
			redirect_to :back
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
		params.require(:classified).permit(:make ,:sold,:model,:year,:color,:title,:condition,:price,:offer,:make_country	,:category	,:description , :category_id,:photos , :created_at)
	end
end


