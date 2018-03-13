Rails.application.routes.draw do
  resources :dogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/dogs' => 'dogs#index'
  post '/dogs' => 'dogs#create'
end
