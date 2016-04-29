class PhotosController < ApplicationController
  before_action :signed_in_user
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  before_action :verify_correct_user, only: [:edit, :update, :destroy]


  # GET /photos
  # GET /photos.json
  def index
    @photos = Photo.all
   # @photos = current_user.photos.order(created_at: :desc)
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @photo = Photo.find(params[:id])
    @user = User.find(params[:user_id])
  end

  # GET /photos/new
  def new
    @photo = Photo.new
    @user = User.find(params[:user_id])
  end

  # GET /photos/1/edit
  def edit
    @photo = Photo.find(params[:id])
    # @users = User.find(params[:user_id])
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(photo_params)
    @photo.user = current_user

    respond_to do |format|
      if @photo.save
        format.html { redirect_to [current_user, @photo], notice: 'Photo was successfully created.' }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to user_photo_path(current_user, @photo), notice: 'Photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to user_path(current_user), notice: 'Photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:title, :description, :image)
    end

    def verify_correct_user
      @photo = current_user.photos.find_by(id: params[:id])
      redirect_to root_url, notice: 'Access Denied!' if @photo.nil?
   end
end
