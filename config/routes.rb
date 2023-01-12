Rails.application.routes.draw do
  
  devise_for :students
  devise_for :teachers
  devise_for :admins, :controllers => {:sessions => "admin_session"}
  devise_scope :admin do
    get 'admin_session/index', to: "admin_session#index"
  end
  
  namespace :admin do
    resources :students do
      collection do
        get :search
      end
    end
    resources :teachers do
      collection do
        get :search
      end
    end
    resources :courses do
      collection do
        get :search
      end
    end
    resources :sections
    resources :enrollments
  end

  namespace :student do
    resources :dashboard, only: %i[index show]
  end

  # Defines the root path route ("/")
  get 'home/index'
  root "home#index"
  default_url_options :host => "localhost:3000"
end
