Rails.application.routes.draw do
  # Ruta para buscar un empleado por su campo IdUsuario
  get 'empleados/por_usuario/:id', to: 'empleados#por_usuario'

  resources :reporteventas
  resources :clientes
  resources :vehiculos
  resources :checklists
  resources :empleados

  # Ruta de login
  post '/api/seguridad/iniciarsesion', to: 'sessions#create'
end
