source "https://rubygems.org"

# Rails compatible con activerecord-sqlserver-adapter 7.1.x
gem "rails", "~> 7.1.3"

# SQL Server adapter
gem "tiny_tds"
gem "activerecord-sqlserver-adapter", "~> 7.1.3"

# Puma web server
gem "puma", ">= 5.0"

# Windows zoneinfo support
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Rails cache, jobs y cable
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

# Bootsnap para arranque rápido
gem "bootsnap", require: false

# Despliegue con Kamal (opcional)
gem "kamal", require: false

# Aceleración HTTP opcional
gem "thruster", require: false

# Para procesamiento de imágenes si usas Active Storage (opcional)
# gem "image_processing", "~> 1.2"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw mswin x64_mingw ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end
