Spree::Core::Engine.add_routes do
  namespace :admin do
    resources :mark_downs do
      get :apply
    end
  end
end
