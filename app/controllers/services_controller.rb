class ServicesController < ApplicationController
  respond_to :html, :json
  autocomplete :make, :name

  before_action :require_user, only: [:new, :create, :update, :delete]

  # before_action :set_category
  helper_method :sort_column, :sort_direction

  def image_urls
    @service = Service.find(params[:id])
    @photos = @service.photos
  end

  def new
    @service = Service.new
    # @photo = @service.photos.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @service }
    end
  end

  def index
    if params[:tag]
      @services = Service.tagged_with(params[:tag])
    else
      @search = Service.search do
        active_categ = with(:categ, params[:categ]) if params[:categ].present?
        fulltext params[:search]
        facet(:categ)
        # facet(:tags)
      end
      @services = @search.results
    end
  end

  def show
    @service = Service.find(params[:id])
    @photos = @service.photos # CW
    @image_urls = []
    @service.photos.each do |photo|
      @image_urls.push(photo.image.url)
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @service }
    end
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
    if @service.update_attributes(service_params)
      if params[:images]
        # The magic is here ;)
        params[:images].each do |image|
          @service.photos.create(image: image)
        end
      end
      respond_to do |format|
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format| ## Add this
        format.html { render action: 'edit' }
        format.json { render json: @service.errors, status: :unprocessable_entity }
        format.html
      end
    end
  end

  def destroy
    @service = Service.find(params[:id])

    @service.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
      format.js   { render layout: false }
    end
  end

  def create
    @service = Service.new(service_params)
    @service.user_id = current_user.id
    if @service.save
      if params[:images]
        # The magic is here ;)
        params[:images].each do |image|
          @service.photos.create(image: image)
        end
      end
      redirect_to @service
      # format.html { redirect_to @service, notice: 'Service was successfully created.' }
      # format.json { render json: @service, status: :created, location: @service }
    else
      respond_to do |format|
        format.html { render action: 'new' }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
      # r#edirect_to '/'
    end
  end

  def favorite
    type = params[:type]
    @service = Service.find(params[:id])
    if type == 'favorite'
      current_user.favorites << @service
      redirect_to :back # , notice: 'You favorited #{@service.title}'
    elsif type == 'unfavorite'
      current_user.favorites.delete(@service)
      redirect_to :back # , notice: 'Unfavorited #{@service.title}'
    else
      # Type missing, nothing happens
      redirect_to :back # , notice: 'Nothing happened.'
    end
  end

  def flag
    type = params[:type]
    @service = Service.find(params[:id])
    if type == 'flag'
      current_user.flaggings << @service
      redirect_to :back # , notice: 'You favorited #{@service.title}'
    elsif type == 'unflag'
      current_user.flaggings.delete(@service)
      redirect_to :back # , notice: 'Unfavorited #{@service.title}'
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

  def service_params
    params.require(:service).permit(:categ, :specialty, :regions, :price_cents, :title, :price, :description, :photos, :created_at, :content, :name, :tag_list, :tags)
  end
end
