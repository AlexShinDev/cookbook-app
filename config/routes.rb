Rails.application.routes.draw do
  get '/recipes' => 'recipes#index'
  #new and create
  get '/recipes/new' => 'recipes#new'
  post '/recipes' => 'recipes#create'
  #even though dulpicate url, it's fine because different verb
  get '/recipes/:id' => 'recipes#show'
  get '/recipes/:id/edit' => 'recipes#edit'
  patch '/recipes/:id' =>'recipes#update'

  delete '/recipes/:id' => 'recipes#delete'
end
