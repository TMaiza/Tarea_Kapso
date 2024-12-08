Rails.application.routes.draw do
  resources :trainings do
    resources :exercises, only: [:new, :create]
  end
  root 'trainings#index'
end
