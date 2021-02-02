Rails.application.routes.draw do
  get("/",{to:"ideas#index", as: :root})

  resources :ideas do
    resources :reviews,shallow: true, only:[:create, :destroy] do
      resources :likes,only: [:create, :destroy]
    end
  end
  resources :users, only:[:new, :create]
  resource :session, only:[:new, :create, :destroy]
end
