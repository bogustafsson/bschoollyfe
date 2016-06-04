Rails.application.routes.draw do
  # Routes for the Trip resource:
  # CREATE
  get "/trips/new", :controller => "trips", :action => "new"
  post "/create_trip", :controller => "trips", :action => "create"

  # READ
  get "/", :controller => "trips", :action => "index"
  get "/trips", :controller => "trips", :action => "index"
  get "/trips/:id", :controller => "trips", :action => "show"

  # UPDATE
  get "/trips/:id/edit", :controller => "trips", :action => "edit"
  post "/update_trip/:id", :controller => "trips", :action => "update"

  # DELETE
  get "/delete_trip/:id", :controller => "trips", :action => "destroy"
  #------------------------------

  # Routes for the Participant resource:
  # CREATE
  get "/participants/new", :controller => "participants", :action => "new"
  post "/create_participant", :controller => "participants", :action => "create"

  # READ
  get "/participants", :controller => "participants", :action => "index"
  get "/participants/:id", :controller => "participants", :action => "show"

  # UPDATE
  get "/participants/:id/edit", :controller => "participants", :action => "edit"
  post "/update_participant/:id", :controller => "participants", :action => "update"

  # DELETE
  get "/delete_participant/:id", :controller => "participants", :action => "destroy"
  #------------------------------

  devise_for :users
  root 'photos#index'
  #Ensure you have defined root_url to *something* in your config/routes.rb. For example:
  #root to: "trips#index"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
    ### root 'welcome#index'

  #Ensure you have flash messages in app/views/layouts/application.html.erb.
     #For example:

       ###<p class="notice"><%= notice %></p>
       ###<p class="alert"><%= alert %></p>

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
