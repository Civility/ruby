Rails.application.routes.draw do
  # scope '(:locale)' do
  # scope "(:locale)" do #, :locale => /en|ru/ do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'main#index'
  resources :users

end


