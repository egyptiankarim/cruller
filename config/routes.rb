Rails.application.routes.draw do
  root to: 'colour#index'

  get 'colour/index', to: 'colour#index', as: :index
  get 'show/:colour(.:format)', to: 'colour#show', as: :show

  get 'errors/error_404'
  match "/404" => "errors#error_404", via: [ :get, :post, :patch, :delete ]
end
