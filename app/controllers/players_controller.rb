class PlayersController < ApplicationController
  def new
    if authorize! :create, :player
      @player = Player.new
      render :new
    elsif current_user.is? :player
      redirect_to player_path(current_user.player), :alert => "You already have an account!"
    else
      redirect_to_signin
    end
  end
  def create
    if authorize! :create, :player
      p = current_user.register_player!(params[:player])
      redirect_to player_path(p)
    end
  end

  def show
    if authorize! :view, :player
      @player = Player.find(params[:id])
      if @player
        render :show
      else
        not_found!
      end
    end
  end

end
