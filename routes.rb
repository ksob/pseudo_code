namespace :api do
    namespace :v1 do
      resources :permissions, only: [:create] do
      end

      resources :roles, only: [:create] do
        put :assign_permission, on: :member
      end

      resources :users, only: [:create] do
        put :assign_permission, on: :member
        get :has_assigned_permission, on: :member
      end
    end
end
