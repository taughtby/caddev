Caddev::Application.routes.draw do
  resources :subjects
  resources :tutors
  resources :study_groups
  resources :users
    
  get "sessions/new", :as => :sign_in
  get "signout" => 'sessions#destroy', :as => :sign_out
  post "sessions/create"

  get 'pages/sample' => "pages#sample", :as => :sample
  
  root to: 'pages#home'
end
