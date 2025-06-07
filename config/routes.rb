# config/routes.rb
Rails.application.routes.draw do
  # Ruta raíz simple
  root to: proc { [200, {}, ['API funcionando']] }

namespace :api do
  namespace :empleados do
    get 'por_usuario/:id', to: 'empleados#por_usuario'
  end
end


  resources :reporteventas
  resources :clientes
  resources :vehiculos
  resources :checklists

  # Ruta de login
  post '/api/seguridad/iniciarsesion', to: 'sessions#create'
end
