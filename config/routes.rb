Shakeventure::Application.routes.draw do
  root 'static#index'
  get '/adventure' => 'api/adventures#show'
  match '/adventure/update' => 'api/adventures#update', via: [:post]
end

