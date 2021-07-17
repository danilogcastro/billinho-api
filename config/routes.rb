Rails.application.routes.draw do
  namespace :api do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
    end
  end
  
  namespace :api do
    namespace :v1 do
      resources :students, only: [:index, :create]
      resources :enrollments, only: [:index, :create]
    end
  end
end
