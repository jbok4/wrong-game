class GamesController < ActionController::Base

  def index
    games = Game.all
    render json: games
  end

  def create
    game = Game.new(game_params)
    if game.save
      render json: game
    else
      render json: { errors: game.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    game = Game.find_by_id(params[:id])
    @photos = Photo.where(game_id: game.id).order("created_at DESC")
    render json: game
  end

  def update
    game = Game.find_by_id(params[:id])
    if game.update(game_params)
      render json: game
    else
      render json: { errors: game.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # def upvote
  #   game = game.find(params[:id])
  #   #! means it also saves it, so saves writing an extra step
  #   game.increment!(:upvote)

  #   render json: game
  # end

  def destroy
    game = Game.find_by_id(params[:id])
    game.destroy
  end

  private

  def game_params
    params.require(:game).permit(:home_team, :away_team, :date, :location)
  end
end