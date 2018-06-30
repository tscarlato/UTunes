
Rails.application.routes.draw do
  get 'welcome/index'
 
  resources :cassettes do
  resources :songs
  end

  root 'welcome#index'
end
