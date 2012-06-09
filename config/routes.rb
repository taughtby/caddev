Caddev::Application.routes.draw do
  get 'study_groups/' => "study_groups#index", :as => :study_groups
  get 'study_groups/:id' => "study_groups#show"

  resources :subjects
  resources :tutors
  resources :users
  resources :students
  resources :tutor_reviews
    
  get "sessions/new", :as => :sign_in
  get "signout" => 'sessions#destroy', :as => :sign_out
  post "sessions/create"

  get 'pages/sample' => "pages#sample", :as => :sample
  
  root to: 'pages#home'
end
