Offlinecourses::Application.routes.draw do
  resources :courses do
    resources :events do
      member do
        post "go"
        post "pass"
      end
    end

    #subscribe
    member do
      post 'subscribe'
      delete 'unsubscribe'
    end
  end

  devise_for :users

  root to: "courses#index"
end
