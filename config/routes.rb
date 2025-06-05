# config/routes.rb
Rails.application.routes.draw do
  root to: proc { [200, {}, ['API Trotamundos']] }

  namespace :api do
    namespace :v1 do
      resources :clientes
      resources :vehiculos
    end
  end
end
