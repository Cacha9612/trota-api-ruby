class Api::Empleados::EmpleadosController < ApplicationController
  before_action :set_empleado, only: [:show, :update, :destroy]

  # GET /empleados
  def index
    @empleados = Empleado.all
    render json: @empleados
  end

  # GET /empleados/:id
  def show
    render json: @empleado
  end

  # GET /empleados/por_usuario/:id_usuario
def por_usuario
  empleado = Empleado.includes(:rol).find_by(IdUsuario: params[:id])

  if empleado
    render json: [{
      IdUsuario: empleado.IdUsuario,
      Nombre: empleado.Nombre,
      Id_Rol: empleado.Id_Rol,
      Descripcion: empleado.rol_nombre,
      Estatus: empleado.Estatus
    }]
  else
    render json: []
  end


  # POST /empleados
  def create
    empleado = Empleado.new(empleado_params)
    if empleado.save
      render json: empleado, status: :created
    else
      render json: { errors: empleado.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PUT /empleados/:id
  def update
    if @empleado.update(empleado_params)
      render json: @empleado
    else
      render json: { errors: @empleado.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /empleados/:id
  def destroy
    @empleado.destroy
    head :no_content
  end

  private

  def set_empleado
    @empleado = Empleado.find_by(id: params[:id])
    render(json: { error: "Empleado no encontrado" }, status: :not_found) unless @empleado
  end

  def empleado_params
    # Recuerda usar snake_case en tu JSON. Si mandas { "IdUsuario": 1, … }, Rails lo interpretará como params[:IdUsuario].
    params.require(:empleado).permit(:IdUsuario, :Nombre, :Rol, :Estatus)
  end
end
