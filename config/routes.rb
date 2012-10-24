Offlinecourses::Application.routes.draw do
  resources :courses
  devise_for :users

  root to: "courses#index"
end
