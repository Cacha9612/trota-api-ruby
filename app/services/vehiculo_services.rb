class VehiculoServices
  def self.crear_vehiculo(params)
    Vehiculo.create(params)
  end

  def self.actualizar_vehiculo(id, params)
    vehiculo = Vehiculo.find(id)
    vehiculo.update(params)
    vehiculo
  end

  def self.eliminar_vehiculo(id)
    vehiculo = Vehiculo.find(id)
    vehiculo.destroy
  end

  def self.obtener_vehiculo(id)
    Vehiculo.find(id)
  end

  def self.listar_vehiculos
    Vehiculo.all
  end
end
