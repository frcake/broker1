
class ClassifiedsController < ApplicationController


  #before_action :require_user, only: [:index, :show]

  before_action :set_category
  helper_method :sort_column, :sort_direction

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





  def search
    @search = Sunspot.search(Classified ) do
      paginate(:page => params[:page] || 1, :per_page => 10)
      if params[:sort]
        order_by(sort_column , sort_direction)
      else
        order_by(:created_at , :desc)
      end
      fulltext params[:search]
      with(:created_at)

      active_model = with(:model ,params[:model]) if params[:model].present?
      active_make = with(:make , params[:make]) if params[:make].present?
      active_make_country = with(:make_country , params[:make_country]) if params[:make_country].present?
      active_condition = with(:condition,params[:condition]) if params[:condition].present?
      active_category = with(:cat,params[:cat]) if params[:cat].present?
      active_subcategory = with(:treecat,params[:treecat]) if params[:treecat].present?
      active_giveaway = with(:giveaway,params[:giveaway]) if params[:giveaway].present?
      active_sell = with(:sell,params[:sell]) if params[:sell].present?
      active_trade = with(:trade,params[:trade]) if params[:trade].present?
      with(:price).less_than_or_equal_to(params[:prcmax].to_i) if params[:prcmax].present?
      with(:price).greater_than_or_equal_to(params[:prcmin].to_i) if params[:prcmin].present?



      facet(:giveaway)
      facet(:sell)
      facet(:trade)
      facet(:price)
      facet(:model)
      #facet(:model , exclude: active_condition)
      facet(:make)
      facet(:make_country)
      facet(:condition)
      facet(:cat)
      facet(:treecat)

    end
    @classifieds = @search.results
  end





  def index
    if @category.present?
      @classifieds = @category.nested_classifieds
      nested_categories = []
      @category.nested_categories.each do |f|
        nested_categories << f.id
      end

      @search = Sunspot.search(Classified) do
        paginate(:page => params[:page] || 1, :per_page => 10)
        if params[:sort]
          order_by(sort_column , sort_direction)
        else
          order_by(:created_at , :desc)
        end
        fulltext params[:search]
        with(:categoryid,nested_categories)
        with(:price).less_than_or_equal_to(params[:prcmax].to_i) if params[:prcmax].present?
        with(:price).greater_than_or_equal_to(params[:prcmin].to_i) if params[:prcmin].present?
        active_model = with(:model ,params[:model]) if params[:model].present?
        active_make = with(:make , params[:make]) if params[:make].present?
        active_make_country = with(:make_country , params[:make_country]) if params[:make_country].present?
        active_condition = with(:condition,params[:condition]) if params[:condition].present?
        active_category = with(:cat,params[:cat]) if params[:cat].present?
        active_subcategory = with(:treecat,params[:treecat]) if params[:treecat].present?
        active_giveaway = with(:giveaway,params[:giveaway]) if params[:giveaway].present?
        active_sell = with(:sell,params[:sell]) if params[:sell].present?
        active_trade = with(:trade,params[:trade]) if params[:trade].present?



        facet(:giveaway)
        facet(:sell)
        facet(:trade)
        facet(:price)
        facet(:model)
        #facet(:model , exclude: active_condition)
        facet(:make)
        facet(:make_country)
        facet(:condition)
        facet(:cat)
        facet(:treecat)
      end
      @classifieds = @search.results
    else
      #redirect_to '/'
      #@classified=@search.results
      search
    end
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

      respond_to do |format|
        format.html { redirect_to @classified, notice: 'Classified was successfully updated.' }
        format.json { head :no_content }
      end

    else

      respond_to do |format|  ## Add this
        format.html { render action: "edit" }
        format.json { render json: @classified.errors, status: :unprocessable_entity }
        format.html
      end

    end


  end




  def destroy
    @classified = Classified.find(params[:id])
    if @classified.destroy
      redirect_to :back
    end

    #respond_to do |format|
    # format.html { redirect_to classifieds_url }
    # format.json { head :no_content }
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
      respond_to do |format|
        format.html { render action: "new" }
        format.json { render json: @classified.errors, status: :unprocessable_entity }
      end
      #r#edirect_to '/'
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



  def flag
    type = params[:type]
    @classified = Classified.find(params[:id])
    if type == "flag"
      current_user.flaggings << @classified
      redirect_to :back#, notice: 'You favorited #{@classified.title}'

    elsif type == "unflag"
      current_user.flaggings.delete(@classified)
      redirect_to :back#, notice: 'Unfavorited #{@classified.title}'

    else
      # Type missing, nothing happens
      redirect_to :back#, notice: 'Nothing happened.'
    end
  end






  private

  def set_category
    @category = Category.find(params[:category_id]) if params[:category_id]
  end

  def classified_params
    params.require(:classified).permit(:make,:giveaway,:sell,:trade ,:sold,:model,:year,:color,:title,:condition,:price,:offer,:make_country ,:category  ,:description , :category_id,:photos , :created_at)
  end

  def sort_column
    %w[price created_at].include?(params[:sort]) ? params[:sort] : "created_at"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end
end
