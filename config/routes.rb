Rails.application.routes.draw do
  # Ruta raíz que responde algo simple para verificar que la API está viva
  root to: proc { [200, {}, ['API funcionando']] }

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
