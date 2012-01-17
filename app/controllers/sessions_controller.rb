class SessionsController < ApplicationController

  def new
    # redirect_to '/auth/twitter'
    render :new
  end

  def passthru
    warn ENV['TWITTER_KEY']
    render :text => 'Twitter?'
  end


  def create
    auth = request.env["omniauth.auth"]
    user = User.where("identities.provider" => auth['provider'], 
                      "identities.uid" => auth['uid']).first || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    route = session.delete(:redirect_to) || root_url
    redirect_to route, :notice => 'Signed in!'
  end

  def destroy
    reset_session
    redirect_to root_url, :notice => 'Signed out!'
  end

  def failure
    redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end

end
