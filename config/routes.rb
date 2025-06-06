Rails.application.routes.draw do
  resources :reporteventas
  resources :clientes
  resources :vehiculos
  resources :checklists
  resources :empleados

  # Ruta para buscar un empleado por su campo IdUsuario
  get 'empleados/por_usuario/:id', to: 'empleados#por_usuario'


  # Ruta de login
  post '/api/seguridad/iniciarsesion', to: 'sessions#create'
end
