class ClienteServices
  def self.listar
    Cliente.all
  end

  def self.buscar(id)
    Cliente.find_by(id: id)
  end

  def self.crear(params)
    Cliente.create(params)
  end

  def self.actualizar(id, params)
    cliente = Cliente.find_by(id: id)
    return nil unless cliente

    cliente.update(params)
    cliente
  end

  def self.eliminar(id)
    cliente = Cliente.find_by(id: id)
    cliente&.destroy
  end
end
