Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :users do
    resources :users, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :users, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :users, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
