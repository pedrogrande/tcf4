class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def guest_user
    begin
      # Cache the value the first time it's gotten.
      @cached_guest_user ||= GuestUser.find(session[:guest_user_id] ||= create_guest_user.id)
      # sign_in(:user, @cached_guest_user)

     rescue ActiveRecord::RecordNotFound # if session[:guest_user_id] invalid
       session[:guest_user_id] = nil
       guest_user
     end
  end

  private

  def create_guest_user
    u = GuestUser.create
    u.save!
    session[:guest_user_id] = u.id
    u
  end
end
