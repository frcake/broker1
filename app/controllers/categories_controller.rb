class CategoriesController < ApplicationController


  def index
    @root_categories = Categories.roots
  end


  def show
    #@categories = Category.find_by_id(params[:id]).self_and_descendants
    @category = Category.find_by_id(params[:id])
    @search = Sunspot.search(Category) do
      fulltext params[:search]
      active_model = with(:name ,params[:name]) if params[:name].present?
      facet(:name)
    end
    @classifieds = @search.results
  end
end
