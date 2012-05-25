Caddev::Application.routes.draw do
  get "sessions/new", :as => :sign_in
  get "signout" => 'sessions#destroy', :as => :sign_out
  post "sessions/create"

    resources :users
  
  root to: 'pages#home'

  get 'pages/sample' => "pages#sample", :as => :sample
end
