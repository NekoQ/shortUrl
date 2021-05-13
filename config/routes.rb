Rails.application.routes.draw do
  root 'links#new'

  get '/new', to: 'links#new'
  post '/new', to: 'links#create'

  get '/:short', to: 'links#index'
end
