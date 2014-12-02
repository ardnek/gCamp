Rails.application.routes.draw do

  resources :projects do
    resources :tasks
    resources :memberships
  end

  resources :users

  # resources :comments, only: [:create]
  # resources :comments, :only => [:create]

  root "pages#index"

  post 'comments' => 'comments#create'

  #get 'comments' => 'comments#new'

  #match '/investors/new', to: 'investors#new',    via: 'get'
  #post '/task/:task_id/create_comment' => 'tasks#create_comment', as: :task_comments

  get 'about' => 'pages#about', as: :about
  get 'terms' => 'pages#terms', as: :terms
  get 'faq' => 'pages#faq', as: :faq

  get '/sign-up' => 'registrations#new', as: :signup
  post '/sign-up' => 'registrations#create'
  get '/sign-in' => 'authentication#new', as: :signin
  post '/sign-in' => 'authentication#create'
  get '/sign-out' => 'authentication#destroy', as: :signout

end
