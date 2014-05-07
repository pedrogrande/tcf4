Rails.application.routes.draw do
  resources :testimonials

  get 'testimonial' => 'testimonial#index'

  get 'personalised-programme' => 'personalised_programme#index'

  get 'news-and-events' => 'news_and_events#index'

  get 'community' => 'community#index'

  get 'people' => 'people#index'

  get 'all-courses' => 'all_courses#index'

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

  root 'home#index'
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

  resources :user_skills

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
  get 'my-programme' => "my_programme#index"

  get 'my-goals' => "my_goals#index"

  get 'my-skills' => "my_skills#index"

  get 'admin' => 'admin#index'

  resources :guest_user_skills do
    member do
      get :choose
    end
  end

  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
