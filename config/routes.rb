Rails.application.routes.draw do
  get 'static_pages/home'

  get 'static_pages/help'

  resources :microposts
  mount Ckeditor::Engine => '/ckeditor'
  resources :editors
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root 'editors#index'
end
