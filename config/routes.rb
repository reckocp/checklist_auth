Rails.application.routes.draw do

  get '/sign_in', to: 'sessions#sign_in', as: 'sign_in'
  post '/sign_in', to: 'sessions#create'
  get '/sign_out', to: 'sessions#sign_out', as: 'sign_out'
  delete '/sign_out', to: 'sessions#destroy'

  resources :users, only: [:new, :create]

  namespace :api do
    resources :tasks
  end

  resources :tasks
  

  delete 'tasks/:id/delete' => 'tasks#destroy', as: :task_delete

  root 'tasks#index'

end
