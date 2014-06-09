Rails.application.routes.draw do
  resources :specials

  root 'home#index'
  devise_for :users
  resources :users
  get "/courses/web-app-coder-ruby-on-rails", to: redirect('/popular_programmes/web-app-developer-deluxe')
  get "/courses/web-app-coder-angular-and-node", to: redirect('/popular_programmes/web-app-developer-deluxe')
  get "/ruby_on_rails_course_scholarship", to: redirect('/')
  get "/courses/web-app-coder-pro", to: redirect('/popular_programmes/web-app-developer-deluxe')
  get "/courses/beginner-coder-weekend-workshop-melbourne", to: redirect('/popular_programmes/beginner-coder-weekend-programme')
  get "/courses/beginner-coder-weekend-workshop-melbourne-adelaide", to: redirect('/popular_programmes/beginner-coder-weekend-programme')
  get "/courses/expert-coder", to: redirect('/popular_programmes/web-app-developer-deluxe')
  get "/courses/angular-coder", to: redirect('/popular_programmes/web-app-developer-deluxe')
  get "/courses/beginner-coder-weekend-workshop-melbourne-adelaide-sydney-brisbane-perth", to: redirect('/popular_programmes/beginner-coder-weekend-programme')
  get "/courses/rails-coder-web-application-development-course", to: redirect('/popular_programmes/web-application-developer-programme')
  get "/courses/angular-coder-frontend-javascript-framework-course", to: redirect('/popular_programmes/web-application-developer-programme')
  get "/web-development-and-javascript-courses", to: redirect('/')
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
