Rails.application.routes.draw do
  get 'code_log/home'
  post 'code_log/get_repository'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
