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
      current_user.player = Player.new(params[:player])
      current_user.roles << :player
      current_user.save
    end
  end
end
