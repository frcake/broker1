class PhotosController < ApplicationController
  before_action :require_user, only: [:index, :show]

  def index
    @classified = Classified.find(params[:classified_id])

    @photos = @classified.photos

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @photos }
    end
   end

  def show
    @photo = Photo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photo }
    end
    end

  def new
    @classified = Classified.find(params[:classified_id])
    @photo = @classified.photos.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photo }
    end
    end

  def edit
    # @classified = Classified.find(params[:classified_id])

    @photo = Photo.find(params[:id])
    # @photo = Photo.find(params[:id])
  end

  def create
    @photo = Photo.new(params[:photo])

    if @photo.save
      respond_to do |format|
        format.html do
          render json: [@photo.to_jq_upload].to_json,
                 content_type: 'text/html',
                 layout: false
        end
        format.json do
          render json: [@photo.to_jq_upload].to_json
        end
      end
    else
      render json: [{ error: 'custom_failure' }], status: 304
    end
    end

  def update
    @classified = Classified.find(params[:classified_id])

    @photo = @classified.photos.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(photo_params)
        format.html { redirect_to classified_path(@classified), notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
   end

  def destroy
    # @classified = Classified.find(params[:classified_id])
    # @photo = @classified.photos.find(params[:id])
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
    end

  def make_default
    @photo = Photo.find(params[:id])
    @classified = Classified.find(params[:classified_id])

    @classified.cover = @photo.id
    @classified.save

    respond_to do |format|
      format.js
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:description, :classified_id, :image)
  end
end
