Caddev::Application.routes.draw do
  get "study_groups/index"

  get "study_groups/show"

  get "study_groups/update"

  get "study_groups/new"

  get "study_groups/create"

  get "study_groups/delete"

  #mount Soulmate::Server, :at => "/sm"
  
  get "sessions/new", :as => :sign_in
  get "signout" => 'sessions#destroy', :as => :sign_out
  post "sessions/create"

  resources :subjects
  resources :tutors
  resources :study_groups

    resources :users
  
  root to: 'pages#home'

  get 'pages/sample' => "pages#sample", :as => :sample
end
