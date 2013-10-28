Liveexample::Application.routes.draw do
  get "dashboard/show"
  get 'update' => "dashboard#update"
  root 'dashboard#show'
end
