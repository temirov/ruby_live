Liveexample::Application.routes.draw do
  devise_for :users
  get "events" => "dashboard#events"
  resource :dashboard, controller: :dashboard, only: [:show]
  root 'dashboard#show'
end
