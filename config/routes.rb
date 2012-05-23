Caddev::Application.routes.draw do
  root to: 'pages#home'

  get 'pages/sample' => "pages#sample", :as => :sample
end
