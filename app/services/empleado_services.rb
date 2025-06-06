class EmpleadoServices
  def self.crear_empleado(params)
    Empleado.create(params)
  end

  def self.actualizar_empleado(id, params)
    empleado = Empleado.find_by(id: id)
    return nil unless empleado

    empleado.update(params)
    empleado
  end

  def self.eliminar_empleado(id)
    empleado = Empleado.find_by(id: id)
    return false unless empleado

    empleado.destroy
    true
  end

  def self.buscar_empleados(query = nil)
    if query.present?
      Empleado.where("Nombre ILIKE ?", "%#{query}%")
    else
      Empleado.all
    end
  end
end
