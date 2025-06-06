module Api
  module V1
    class ChecklistsController < ApplicationController
      def index
        checklists = Checklist.all
        render json: checklists
        
      end 

      def show
        checklist = Checklist.find(params[:id])
        render json: checklist
      end

      def create
        checklist = Checklist.new(checklist_params)
        if checklist.save
          render json: checklist, status: :created
        else
          render json: checklist.errors, status: :unprocessable_entity
        end
      end

      def update
        checklist = Checklist.find(params[:id])
        if checklist.update(checklist_params)
          render json: checklist
        else
          render json: checklist.errors, status: :unprocessable_entity
        end
      end

      def destroy
        checklist = Checklist.find(params[:id])
        checklist.destroy
        head :no_content
      end

      private

      def checklist_params
        params.require(:checklist).permit(
          :lectura_codigos, :lectura_codigos_observacion, :lectura_codigos_foto,
          :servofreno, :servofreno_observacion, :servofreno_foto,
          :pedal_freno, :pedal_freno_observacion, :pedal_freno_foto,
          :pedal_estacionamiento, :pedal_estacionamiento_observacion, :pedal_estacionamiento_foto,
          :cinturon_seguridad, :cinturon_seguridad_observacion, :cinturon_seguridad_foto,
          :cuadro_instrumentos, :cuadro_instrumentos_observacion, :cuadro_instrumentos_foto,
          :aire_acondicionado, :aire_acondicionado_observacion, :aire_acondicionado_foto,
          :bocina_claxon, :bocina_claxon_observacion, :bocina_claxon_foto,
          :iluminacion_interior, :iluminacion_interior_observacion, :iluminacion_interior_foto,
          :iluminacion_externa, :iluminacion_externa_observacion, :iluminacion_externa_foto,
          :limpiaparabrisas, :limpiaparabrisas_observacion, :limpiaparabrisas_foto,
          :limpia_medallon, :limpia_medallon_observacion, :limpia_medallon_foto,
          :neumaticos_friccion, :neumaticos_friccion_observacion, :neumaticos_friccion_foto,
          :otros_vehiculo_en_piso, :otros_vehiculo_en_piso_observacion, :otros_vehiculo_en_piso_foto,
          :estado_fugas_aceite, :estado_fugas_aceite_observacion, :estado_fugas_aceite_foto,
          :estado_nivel_calidad_lubricante_transmision, :estado_nivel_calidad_lubricante_transmision_observacion, :estado_nivel_calidad_lubricante_transmision_foto,
          :estado_nivel_calidad_lubricante_diferencial, :estado_nivel_calidad_lubricante_diferencial_observacion, :estado_nivel_calidad_lubricante_diferencial_foto,
          :cubrepolvos_flechas, :cubrepolvos_flechas_observacion, :cubrepolvos_flechas_foto,
          :componentes_direccion, :componentes_direccion_observacion, :componentes_direccion_foto,
          :componentes_suspesion, :componentes_suspesion_observacion, :componentes_suspesion_foto,
          :sistema_escape_completo, :sistema_escape_completo_observacion, :sistema_escape_completo_foto,
          :sistema_alimentacion_combustible, :sistema_alimentacion_combustible_observacion, :sistema_alimentacion_combustible_foto,
          :filtro_combustible, :filtro_combustible_observacion, :filtro_combustible_foto,
          :control_fugas_direccion_hidraulica, :control_fugas_direccion_hidraulica_observacion, :control_fugas_direccion_hidraulica_foto,
          :otros_altura_total, :otros_altura_total_observacion, :otros_altura_total_foto,
          :rodamiento_mazas_rueda, :rodamiento_mazas_rueda_observacion, :rodamiento_mazas_rueda_foto,
          :holgura_partes_suspension_rueda, :holgura_partes_suspension_rueda_observacion, :holgura_partes_suspension_rueda_foto,
          :control_neumaticos_desgaste_presion, :control_neumaticos_desgaste_presion_observacion, :control_neumaticos_desgaste_presion_foto,
          :profundidad, :profundidad_observacion, :profundidad_foto,
          :presion, :presion_observacion, :presion_foto,
          :otros_altura_media, :otros_altura_media_observacion, :otros_altura_media_foto,
          :nivel_calidad_aceite_motor, :nivel_calidad_aceite_motor_observacion, :nivel_calidad_aceite_motor_foto,
          :filtro_aire, :filtro_aire_observacion, :filtro_aire_foto,
          :filtro_polen, :filtro_polen_observacion, :filtro_polen_foto,
          :filtro_pcv, :filtro_pcv_observacion, :filtro_pcv_foto,
          :valvula_pcv, :valvula_pcv_observacion, :valvula_pcv_foto,
          :bujias_encendido, :bujias_encendido_observacion, :bujias_encendido_foto,
          :cables_bujias_bobinas_ignicion, :cables_bujias_bobinas_ignicion_observacion, :cables_bujias_bobinas_ignicion_foto,
          :nivel_anticongenlante, :nivel_anticongenlante_observacion, :nivel_anticongenlante_foto,
          :tapon_radiador, :tapon_radiador_observacion, :tapon_radiador_foto,
          :mangueras_sistema, :mangueras_sistema_observacion, :mangueras_sistema_foto,
          :desempeño_ventilador, :desempeño_ventilador_observacion, :desempeño_ventilador_foto,
          :calidad_liquido_limpiaparabrisas, :calidad_liquido_limpiaparabrisas_observacion, :calidad_liquido_limpiaparabrisas_foto,
          :calidad_aceite_direccion_hidraulica, :calidad_aceite_direccion_hidraulica_observacion, :calidad_aceite_direccion_hidraulica_foto,
          :calidad_aceite_transmision_bayoneta, :calidad_aceite_transmision_bayoneta_observacion, :calidad_aceite_transmision_bayoneta_foto,
          :liquido_bateria_condiciones, :liquido_bateria_condiciones_observacion, :liquido_bateria_condiciones_foto,
          :bandas_poly_v, :bandas_poly_v_observacion, :bandas_poly_v_foto,
          :poleas_banda, :poleas_banda_observacion, :poleas_banda_foto,
          :banda_tiempo, :banda_tiempo_observacion, :banda_tiempo_foto,
          :otros_habitaculo_motor, :otros_habitaculo_motor_observacion, :otros_habitaculo_motor_foto,
          :reset_intervalo_servicio, :reset_intervalo_servicio_observacion, :reset_intervalo_servicio_foto,
          :ajuste_tornillos_neumaticos_torquimetro, :ajuste_tornillos_neumaticos_torquimetro_observacion, :ajuste_tornillos_neumaticos_torquimetro_foto,
          :limpiar_libricar_puertas_cerraduras, :limpiar_libricar_puertas_cerraduras_observacion, :limpiar_libricar_puertas_cerraduras_foto,
          :completar_plan_mantenimiento, :completar_plan_mantenimiento_observacion, :completar_plan_mantenimiento_foto,
          :Fecha, :IdEmpleado, :IdVehiculo, :Id_ordendeservicio, :NumeroSerie, :TiempoTranscurrido, :id_checklist, :Activo
        )
      end
    end
  end
end
