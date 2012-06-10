Caddev::Application.routes.draw do

  resources :subjects
  resources :tutors
  resources :users

  resources :study_groups do
    resources :study_group_posts do
      resources :study_group_comments do
      end
    end
  end  
  resources :students
  resources :tutor_reviews
  resources :study_group_registrations
    
    # get 'study_groups/' => "study_groups#index", :as => :study_groups
    # get 'study_groups/:id' => "study_groups#show"

  get "sessions/new", :as => :sign_in
  get "signout" => 'sessions#destroy', :as => :sign_out
  post "sessions/create"

  get 'pages/sample' => "pages#sample", :as => :sample
  
  root to: 'pages#home'
end
