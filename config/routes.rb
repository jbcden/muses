# require 'sidekiq/web'
Muses::Application.routes.draw do

  # mount Sidekiq::Web => '/sidekiq'

  devise_for :donors, :controllers => {:sessions => 'sessions', :registrations => 'donor/registrations', :confirmations => 'confirmations'}

  devise_for :students, :controllers => {:sessions => 'sessions', :registrations => 'student/registrations', :confirmations => 'confirmations'}

  devise_scope :student do
    match '/sign_in' => 'sessions#new'
    match '/sign_out' => 'sessions#destroy', :as => '/sign_out'
    match '/muses/sign_up' => 'student::registrations#new'
    match '/muses/confirmation/new' => 'confirmations#new'
    match '/muses/password/new' => 'devise::passwords#new'
  end

  devise_scope :donor do
    match '/messengers/sign_up' => 'donor::registrations#new'
    match '/messengers/sign_up' => 'student::registrations#new'
    match '/messengers/confirmation/new' => 'confirmations#new'
    match '/messengers/password/new' => 'devise::passwords#new'
  end

  root to: 'application#home'
  get '/contact-us' => 'application#contact_us', :as => :contact
  post '/contact-us' => 'application#submit_comment'

  resources :campaigns, :path => '/muses/'
  resources :students
  resources :donors, :path => '/messengers/'

  match '/donate' => 'donations#donate'
  match '/payment' => 'donations#payment'
  match '/demo-form' => 'application#demo', as: :demo
  match '/donate' => 'donors#donate'
  match '/payment' => 'donors#payment'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
