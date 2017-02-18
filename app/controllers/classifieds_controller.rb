
class ClassifiedsController < ApplicationController
  respond_to :html, :json
  autocomplete :make, :name

  before_action :require_owner, only: [:edit, :update, :delete]
  before_action :require_user, only: [:edit, :new, :create, :update, :delete]

  before_action :set_category
  helper_method :sort_column, :sort_direction
  add_breadcrumb 'Αγγελίες', :classifieds_path

  def image_urls
    @classified = Classified.find(params[:id])
    @photos = @classified.photos
  end

  def new
    add_breadcrumb 'Δημιουργία Αγγελίας', newlisting_path
    @classified = Classified.new
    # @photo = @classified.photos.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @classified }
    end
  end

  def search
    @search = Classified.search(include: [:photos, :category, :flags, :favorite_classifieds, :user]) do
      paginate(page: params[:page] || 1, per_page: 10)
      if params[:sort]
        order_by(sort_column, sort_direction)
      else
        order_by(:created_at, :desc)
      end
      fulltext params[:search]
      with(:created_at)

      active_model = with(:model, params[:model]) if params[:model].present?
      active_make = with(:make, params[:make]) if params[:make].present?
      active_make_country = with(:make_country, params[:make_country]) if params[:make_country].present?
      active_condition = with(:condition, params[:condition]) if params[:condition].present?
      active_category = with(:cat, params[:cat]) if params[:cat].present?
      active_subcategory = with(:treecat, params[:treecat]) if params[:treecat].present?
      active_giveaway = with(:giveaway, params[:giveaway]) if params[:giveaway].present?
      active_sell = with(:sell, params[:sell]) if params[:sell].present?
      active_trade = with(:trade, params[:trade]) if params[:trade].present?
      active_askfor = with(:askingfor, params[:askingfor]) if params[:askingfor].present?
      with(:price).less_than_or_equal_to(params[:prcmax].to_i) if params[:prcmax].present?
      with(:price).greater_than_or_equal_to(params[:prcmin].to_i) if params[:prcmin].present?

      facet(:askingfor)
      facet(:giveaway)
      facet(:sell)
      facet(:trade)
      facet(:price)
      facet(:model)
      # facet(:model , exclude: active_condition)
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
      add_breadcrumb @category.root.name.to_s, category_classifieds_path(category_id: @category.root.id) if @category.root
      add_breadcrumb @category.parent.name.to_s, category_classifieds_path(category_id: @category.parent.id) if @category.parent && @category.parent != @category.root
      add_breadcrumb @category.name.to_s, :category_classifieds_path if @category != @category.root
      nested_categories = []
      @category.nested_categories.each do |f|
        nested_categories << f.id
      end

      @search = Classified.search(include: [:photos, :category, :flags, :favorite_classifieds, :user]) do
        paginate(page: params[:page] || 1, per_page: 10)
        if params[:sort]
          order_by(sort_column, sort_direction)
        else
          order_by(:created_at, :desc)
        end
        fulltext params[:search]
        with(:categoryid, nested_categories)
        with(:price).less_than_or_equal_to(params[:prcmax].to_i) if params[:prcmax].present?
        with(:price).greater_than_or_equal_to(params[:prcmin].to_i) if params[:prcmin].present?
        active_model = with(:model, params[:model]) if params[:model].present?
        active_make = with(:make, params[:make]) if params[:make].present?
        active_make_country = with(:make_country, params[:make_country]) if params[:make_country].present?
        active_condition = with(:condition, params[:condition]) if params[:condition].present?
        active_category = with(:cat, params[:cat]) if params[:cat].present?
        active_subcategory = with(:treecat, params[:treecat]) if params[:treecat].present?
        active_giveaway = with(:giveaway, params[:giveaway]) if params[:giveaway].present?
        active_askfor = with(:askingfor, params[:askingfor]) if params[:askingfor].present?
        active_sell = with(:sell, params[:sell]) if params[:sell].present?
        active_trade = with(:trade, params[:trade]) if params[:trade].present?

        facet(:askingfor)
        facet(:giveaway)
        facet(:sell)
        facet(:trade)
        facet(:price)
        facet(:model)
        facet(:make)
        facet(:make_country)
        facet(:condition)
        facet(:cat)
        facet(:treecat)
        # facet(:model , exclude: active_condition)
      end
      @classifieds = @search.results
    else
      # redirect_to '/'
      # @classified=@search.results
      search
    end
  end

  def show
    @classified = Classified.find(params[:id])
    @category = @classified.category
    if @classified.category.parent.present?
      add_breadcrumb @classified.category.parent.parent.name.to_s, category_classifieds_path(category_id: @category.root.id) if @classified.category.parent.parent
    end
    add_breadcrumb @classified.category.parent.name.to_s, category_classifieds_path(category_id: @category.parent.id) if @classified.category.parent
    add_breadcrumb @classified.category.name.to_s, category_classifieds_path(category_id: @category.id) if @classified.category.name

    add_breadcrumb @classified.title.to_s, :classified_path
    @photos = @classified.photos # CW
    @image_urls = []
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
    if current_user.id = @classified.user_id
      if @classified.update_attributes(classified_params)
        if params[:images]
          # The magic is here ;)
          params[:images].each do |image|
            @classified.photos.create(image: image)
          end
        end
        respond_to do |format|
          format.html { redirect_to @classified, notice: 'Classified was successfully updated.' }
          format.json { head :no_content }
        end
      else
        respond_to do |format| ## Add this
          format.html { render action: 'edit' }
          format.json { render json: @classified.errors, status: :unprocessable_entity }
          format.html
        end
      end
    end
  end

  def destroy
    @classified = Classified.find(params[:id])
    # redirect_to :back if @classified.destroy
    @classified.destroy

    respond_to do |format|
      format.json { head :no_content }
      format.js   { render layout: false }
    end
  end

  def create
    @classified = Classified.new(classified_params)
    @classified.user_id = current_user.id

    if @classified.save
      if params[:images]
        # The magic is here ;)
        params[:images].each do |image|
          @classified.photos.create(image: image)
        end
      else
        @classified.photos.create
      end
      redirect_to @classified
      # format.html { redirect_to @classified, notice: 'Classified was successfully created.' }
      # format.json { render json: @classified, status: :created, location: @classified }
    else
      respond_to do |format|
        format.html { render action: 'new' }
        format.json { render json: @classified.errors, status: :unprocessable_entity }
      end
      # r#edirect_to '/'
    end
  end

  def sold
    type = params[:type]
    @classified = Classified.find(params[:id])

    if type == 'sold'
      @classified.update_attributes(sold: true)
      respond_to do |format|
        format.js { render 'users/sold.js.erb' }
      end
    elsif type == 'unsold'
      @classified.update_attributes(sold: false)
      respond_to do |format|
        format.js { render 'users/sold.js.erb' }
      end
    end
  end

  def favorite
    type = params[:type]
    @classified = Classified.find(params[:id])
    if type == 'favorite'
      current_user.favorites << @classified
      respond_to do |format|
        format.js { render 'favorite.js.erb' }
      end
    elsif type == 'unfavorite'
      current_user.favorites.delete(@classified)
      respond_to do |format|
        format.js { render 'favorite.js.erb' }
      end

    elsif type == 'deletefavorite'
      current_user.favorites.delete(@classified)
      respond_to do |format|
        format.js { render 'destroyfavorite.js.erb' }
      end
    elsif type == 'statsfavorite'
      current_user.favorites << @classified
      respond_to do |format|
        format.js { render 'statsupdate.js.erb' }
      end
    elsif type == 'statsunfavorite'
      current_user.favorites.delete(@classified)
      respond_to do |format|
        format.js { render 'statsupdate.js.erb' }
      end
    else
      # Type missing, nothing happens
      redirect_to :back # , notice: 'Nothing happened.'
    end
  end

  def flag
    type = params[:type]
    @classified = Classified.find(params[:id])
    if type == 'flag'
      current_user.flaggings << @classified
      # redirect_to :back # , notice: 'You favorited #{@classified.title}'
      respond_to do |format|
        format.js
      end

    elsif type == 'unflag'
      current_user.flaggings.delete(@classified)
      # redirect_to :back # , notice: 'Unfavorited #{@classified.title}'
      respond_to do |format|
        format.js
      end
    elsif type == 'statsflag'
      current_user.flaggings << @classified
      # redirect_to :back # , notice: 'You favorited #{@classified.title}'
      respond_to do |format|
        format.js { render 'statsupdate.js.erb' }
      end

    elsif type == 'statsunflag'
      current_user.flaggings.delete(@classified)
      # redirect_to :back # , notice: 'Unfavorited #{@classified.title}'
      respond_to do |format|
        format.js { render 'statsupdate.js.erb' }
      end
    else
      # Type missing, nothing happens
      redirect_to :back # , notice: 'Nothing happened.'
    end
  end

  private

  def require_user
    unless current_user
      flash[:notice] = 'Πρέπει να είστε μέλος για να έχετε πρόσβαση σε αυτή τη σελίδα'
      redirect_to new_user_registration_path
    end
  end

  def require_owner
    unless current_user.id == Classified.find(params[:id]).user_id
      flash[:notice] = 'Δεν έχετε δικαίωμα προσπέλασης'
      redirect_to Classified.find(params[:id])
     end
  end

  def set_category
    @category = Category.find(params[:category_id]) if params[:category_id]
  end

  def classified_params
    params.require(:classified).permit(:make, :askingfor, :giveaway, :sell, :trade, :sold, :model, :year, :color, :title, :condition, :price, :offer, :make_country, :category, :description, :category_id, :photos, :created_at)
  end

  def sort_column
    %w(price created_at).include?(params[:sort]) ? params[:sort] : 'created_at'
  end

  def sort_direction
    %w(asc desc).include?(params[:direction]) ? params[:direction] : 'desc'
  end
end
