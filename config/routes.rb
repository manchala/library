Library::Application.routes.draw do 
  match '/' => 'book#index'
  resources :articles

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
   match '/signup', to: 'users#new'
   match '/signin', to: 'sessions#new'
   match '/users/:id', to: 'users#show'
  

  #get "users/new"

  #resources :book, :collection => { :list => :get }
  resources :book do
    member do
      get 'book', :to => "book#show"
      post 'book', :to => "book#update", :as => :index
      delete 'book', :to => "book#delete", :as => :index
      put 'book'
      #match 'book/about', :to=>"book#about"
      match '/book/about', :to => "book#about", :as => :index
    end
  end
  
 
  #resources :book, :member => {:list => :get, :show => :get} 
  #match "/book/:id" => "book#show"
  #get "book/index"
  #get "book/show"
  #get "book/list"
  #get "book/create"
  #get "book/new"
  #get "book/edit"
  
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
  # match ':controller(/:action(/:id(.:format)))'
  # map.connect ':controller/:action/:id'

end
