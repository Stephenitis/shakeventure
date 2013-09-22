Shakeventure::Application.routes.draw do
  root 'static#index'

  get '/adventure' => 'api/adventures#show'
end
