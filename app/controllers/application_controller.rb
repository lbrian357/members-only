class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :logged_in?


  # logs in and remembers user
  def log_in(user)
    #session[:user_id] = user.id
    user.create_remember_digest
    #cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token 
  end

  def current_user
    #if (user_id = session[:user_id])
    if (remember_token = cookies[:remember_token])
      @current_user ||= User.find_by(remember_digest: User.digest(remember_token))
    end
    #elsif (user_id = cookies.signed[:user_id])
    #  user = User.find_by(id: user_id)
    #  if user && user.authenticated?(:remember, cookies[:remember_token])
    #    log_in user
    #    @current_user = user
    #  end

    #@current_user ||= User.find_by(remember_digest: User.digest(cookies[:remember_token]))
  end

  #def current_user=(user)
  #  @current_user = User.find_by(id: user.id)
  #end

  def log_out
    #session.delete(:user_id)
    cookies.delete(:remember_token)
    @current_user = nil
  end

  def logged_in?
    !current_user.nil?
  end
end




