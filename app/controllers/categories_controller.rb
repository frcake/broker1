class CategoriesController < ApplicationController


	def index 

		@root_categories = Categories.roots

	end


	def show
		#@categories = Category.find_by_id(params[:id]).self_and_descendants
		#@category = Category.find_by_id(params[:id]).self_and_descendants

		@category = Category.find_by_id(params[:id])
	end

end
