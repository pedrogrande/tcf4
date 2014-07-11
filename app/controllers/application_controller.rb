class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :get_popular_programmes, :get_banner
  before_action :capture_referral
  

  
  def get_popular_programmes
    @popular_programmes = PopularProgramme.order_by_price
  end
  

  # def get_goals
  #   @menu_goals = Goal.all
  # end

  def get_banner
    @banner = Banner.first
  end

  
  
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

  def capture_referral
    session[:ref] = params[:ref] if params[:ref]
    if ReferralVisit.find_by(ref_session: session[:ref])
      @referral_visit = ReferralVisit.find_by(ref_session: session[:ref])
      @referral_visit.update(updated_at: DateTime.now)
    else
      @referral_visit = ReferralVisit.new
      @referral_visit.referrer = Referrer.find_by(referral_code: params[:ref])
      @referral_visit.ref_session = session[:ref]
      @referral_visit.save
    end
  end
end
