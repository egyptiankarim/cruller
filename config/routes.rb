Rails.application.routes.draw do
  get 'errors/error_404'
  root to: 'colour#index'
  get 'colour/index', to: 'colour#index', as: :index
  get 'show/:colour(.:format)', to: 'colour#show', as: :show

  match "/404" => "errors#error_404", via: [ :get, :post, :patch, :delete ]
end
