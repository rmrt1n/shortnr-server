Rails.application.routes.draw do
  get '/shorten', to: 'url_object#shorten'
  get '/report', to: 'visit#report'
  get '/:slug', to: 'url_object#show'
end
