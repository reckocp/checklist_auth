Rails.application.routes.draw do
  resources :tasks

  delete 'tasks/:id/delete' => 'tasks#destroy', as: :task_delete

  root 'tasks#index'

end
