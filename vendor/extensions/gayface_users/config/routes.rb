Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :gayface_users do
    resources :gayface_users, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :gayface_users, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :gayface_users, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
