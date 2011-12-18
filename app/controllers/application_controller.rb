class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  helper_method :user_signed_in?
  helper_method :correct_user?

  private
    def current_user
      begin
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
      rescue Exception
      end
      @current_user ||= User.new
    end

    def authorize!(*args)
      if current_user.can?(*args)
        true
      else
        false
      end
    end

    def auth_hash
      request.env['omniauth.auth']
    end

    def user_signed_in?
      return true if current_user
    end

    def redirect_to_signin
      session[:redirect_to] = request.path
      redirect_to signin_path, :alert => 'You need to sign in for access to this page.'
    end
    def authenticate_user!
      if !current_user
        session[:redirect_to] = request.path
        redirect_to signin_path, :alert => 'You need to sign in for access to this page.'
        false
      else
        true
      end
    end

end
