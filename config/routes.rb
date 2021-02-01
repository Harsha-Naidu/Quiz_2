Rails.application.routes.draw do
  get("/",{to:"ideas#index", as: :root})

  resources :ideas 
  
  
end
