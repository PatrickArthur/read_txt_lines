Rails.application.routes.draw do

root 'lines#index'

resources :lines, only: [:index, :show]
end
