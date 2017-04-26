class PhotosController < ActionController::Base
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  before_action :set_game, except: [:index, :show]

  def index
    photos = Photo.all
    render json: photos
  end

  def create
    @photo = @game.photos.build(photo_params)
    if @photo.save
      render json: @photo
    else
      render json: {errors: @photo.errors.full_messages}
    end
  end

  def edit
  end

  def show
    game = Game.find_by_id(params[:id])
    render json: photo
  end

  def update
    @photos.update(photo_params)
  end

  private

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def set_game
    @game - Game.find(params[:game_id])
  end

  def photo_params
    params.require(:photo).permit(:game_id, :img, :caption)

end