class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :image_url, :user_stash_count

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # This probably should not be here (should directly use photo?)
  def image_url
    self.image.url
  end

  #This should be a method on user and then use current_user.stash_count in views
  def user_stash_count
    current_user.stash.photos.count
  end
end
