Offlinecourses::Application.routes.draw do
  resources :courses do
    resources :events

    #subscribe
    member do
      post 'subscribe'
      delete 'unsubscribe'
    end
  end

  devise_for :users

  root to: "courses#index"
end
