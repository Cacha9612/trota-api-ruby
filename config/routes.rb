Rails.application.routes.draw do
  # Endpoints REST para todos los recursos migrados
  resources :reporteventas
  resources :clientes
  resources :vehiculos
  resources :checklists
  resources :empleados
  


  # Ruta para login
  get 'empleados/por_usuario/:id_usuario', to: 'empleados#por_usuario'
  post '/api/seguridad/iniciarsesion', to: 'sessions#create'
end
