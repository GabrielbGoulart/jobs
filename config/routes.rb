Rails.application.routes.draw do
  resources :jobs do
    resources :applications
  end

  root 'jobs#index'
end
