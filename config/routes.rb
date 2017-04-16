Spree::Core::Engine.routes.draw do

  namespace :admin, path: Spree.admin_path do
    resources :reports, only: [:index] do
      collection do
        get :out_of_stock
        post :out_of_stock
      end
    end
  end

end
