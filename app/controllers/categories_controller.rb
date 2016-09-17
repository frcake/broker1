class CategoriesController < ApplicationController


	def index 

		@root_categories = Categories.roots

		

	end


	def show
		#@categories = Category.find_by_id(params[:id]).self_and_descendants
		#@category = Category.find_by_id(params[:id]).self_and_descendants

=begin
		@search = Category.roots.search do 
			fulltext params[:search]		
			facet :name
			with(:name , params[:name]) if params[:name].present?
			
		end
		@category = @search.results
=end	

		@category = Category.find_by_id(params[:id])

		@search = Sunspot.search(Classified) do 
			fulltext params[:search]
			with(:created_at)
			facet :model
			with(:model , params[:model]) if params[:model].present?
			facet :make
			with(:make , params[:make]) if params[:make].present?
			facet :created_month
			with(:created_month , params[:month]) if params[:month].present?
		end
		@classified = @search.results


	end

end
