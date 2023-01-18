Rails.application.routes.draw do
  
  devise_for :students
  devise_for :teachers
  devise_for :admins
  
  namespace :admin do
    root 'dashboard#index'
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
    resources :dashboard
  end

  namespace :student do
    root 'dashboard#index'
    resources :dashboard
    get 'dashboard/enrollments/:id', to: 'dashboard#enrollments', as: :enrollments
    get 'dashboard/student_history/:id', to: 'dashboard#student_history', as: :history
  end

  namespace :teacher do
    root 'dashboard#index'
    resources :dashboard
    get 'dashboard/section/:id', to: 'dashboard#section', as: :sections
    get 'dashboard/course/:id', to: 'dashboard#course', as: :courses
  end

  # Defines the root path route ("/")
  get 'home/index'
  root "home#index"
  default_url_options :host => "localhost:3000"
end