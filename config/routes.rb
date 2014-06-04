Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :popular_programmes
  resources :enrolments do
    member do
      get :thanks
    end
  end

  get 'privacy' => 'privacy#index'
  get 'payment-plans' => 'payment_plans#index'

  

  get 'thanks' => 'thanks#index'

  # get 'all-workshops' => "all_workshops#index"

  # get 'dashboard' => 'dashboard#index'

  resources :enquiries

  resources :banners

  resources :weekend_programmes

  
  resources :testimonials

  get 'testimonial' => 'testimonial#index'

  resources :locations

  resources :unit_sessions


  get 'personalised-programme' => 'personalised_programme#index'

  get 'news-and-events' => 'news_and_events#index'

  get 'community' => 'community#index'

  get 'people' => 'people#index'

  # get 'all-courses' => 'all_courses#index'

  resources :points_transactions

  resources :posts

  resources :categories

  get 'free-tutorials' => 'tutorials#index'

  get 'blog' => 'blog#index'

  get 'contact' => 'contact#index'

  get 'about' => 'about#index'

  resources :purchases do
    member do
      patch :upgrade_to_pack
    end
  end
  resources :payments

  resources :credit_point_packs

  
  resources :programmes do
    member do
      get :save
      get :enrol
      delete :remove_unit
      get :add_unit
    end
  end

  resources :goal_units

  resources :goal_skills

  resources :user_units

  resources :user_goals

  resources :unit_skills

  resources :user_skills do
    member do
      get :choose
    end
  end

  resources :goals do
    member do
      post :choose
      get :add_unit
      get :remove_unit
    end
  end

  resources :units

  resources :skill_levels

  resources :profiles

  resources :skills

  resources :skill_groups
  resources :guest_users, only: :update
  resources :guest_user_goals, only: :destroy
  resources :my_programmes, only: [:index, :new]

  get 'my-goals' => "my_goals#index"

  get 'my-skills' => "my_skills#index"

  get 'admin' => 'admin#index'

  resources :guest_user_skills do
    member do
      get :choose
    end
  end

  

end
