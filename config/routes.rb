Rails.application.routes.draw do
  #metodo de rotas. cria automaticamente o crud (rotas)
  resources :recipes
  resources :ingredients
end
