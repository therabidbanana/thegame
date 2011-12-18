class PlayersController < ApplicationController
  def new
    if authenticate_user!
      render :new
    end
  end
end
