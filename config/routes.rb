Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/internal_server_error'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # GET /learnmore
  get "signup", to: "learnmore#index"
  post "signup", to: "learnmore#create"
  patch "signup", to: "learnmore#index"
  get "thankyou", to: "learnmore#thankyou"
  get root to: "home#index"
  match "/400", to: "errors#not_found", via: :all 
  match "/422", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
end
