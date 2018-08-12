Rails.application.routes.draw do

  get 'home/page'
  get 'home/osvita'
  get 'home/zdobutky'
  get 'home/classy'
  get 'home/programy'
  get 'home/plany'
  devise_for :users
   resources :plans, only: [:index, :new, :create, :destroy]
   resources :resumes, only: [:index, :new, :create, :destroy]
   root "home#page"


end
