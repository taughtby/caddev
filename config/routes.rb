Caddev::Application.routes.draw do
  get "study_group/index"

  #mount Soulmate::Server, :at => "/sm"
  
  get "sessions/new", :as => :sign_in
  get "signout" => 'sessions#destroy', :as => :sign_out
  post "sessions/create"

  resources :subjects
  resources :tutors

    resources :users
  
  root to: 'pages#home'

  get 'pages/sample' => "pages#sample", :as => :sample
end
