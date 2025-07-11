class CreateChecklists < ActiveRecord::Migration[7.1]
  def change
    create_table :checklists do |t|
      t.integer :lectura_codigos
      t.text :lectura_codigos_observacion
      t.text :lectura_codigos_foto
      t.integer :servofreno
      t.text :servofreno_observacion
      t.text :servofreno_foto
      t.integer :pedal_freno
      t.text :pedal_freno_observacion
      t.text :pedal_freno_foto
      t.integer :pedal_estacionamiento
      t.text :pedal_estacionamiento_observacion
      t.text :pedal_estacionamiento_foto
      t.integer :cinturon_seguridad
      t.text :cinturon_seguridad_observacion
      t.text :cinturon_seguridad_foto
      t.integer :cuadro_instrumentos
      t.text :cuadro_instrumentos_observacion
      t.text :cuadro_instrumentos_foto
      t.integer :aire_acondicionado
      t.text :aire_acondicionado_observacion
      t.text :aire_acondicionado_foto
      t.integer :bocina_claxon
      t.text :bocina_claxon_observacion
      t.text :bocina_claxon_foto
      t.integer :iluminacion_interior
      t.text :iluminacion_interior_observacion
      t.text :iluminacion_interior_foto
      t.integer :iluminacion_externa
      t.text :iluminacion_externa_observacion
      t.text :iluminacion_externa_foto
      t.integer :limpiaparabrisas
      t.text :limpiaparabrisas_observacion
      t.text :limpiaparabrisas_foto
      t.integer :limpia_medallon
      t.text :limpia_medallon_observacion
      t.text :limpia_medallon_foto
      t.integer :neumaticos_friccion
      t.text :neumaticos_friccion_observacion
      t.text :neumaticos_friccion_foto
      t.integer :otros_vehiculo_en_piso
      t.text :otros_vehiculo_en_piso_observacion
      t.text :otros_vehiculo_en_piso_foto
      t.integer :estado_fugas_aceite
      t.text :estado_fugas_aceite_observacion
      t.text :estado_fugas_aceite_foto
      t.integer :estado_nivel_calidad_lubricante_transmision
      t.text :estado_nivel_calidad_lubricante_transmision_observacion
      t.text :estado_nivel_calidad_lubricante_transmision_foto
      t.integer :estado_nivel_calidad_lubricante_diferencial
      t.text :estado_nivel_calidad_lubricante_diferencial_observacion
      t.text :estado_nivel_calidad_lubricante_diferencial_foto
      t.integer :cubrepolvos_flechas
      t.text :cubrepolvos_flechas_observacion
      t.text :cubrepolvos_flechas_foto
      t.integer :componentes_direccion
      t.text :componentes_direccion_observacion
      t.text :componentes_direccion_foto
      t.integer :componentes_suspesion
      t.text :componentes_suspesion_observacion
      t.text :componentes_suspesion_foto
      t.integer :sistema_escape_completo
      t.text :sistema_escape_completo_observacion
      t.text :sistema_escape_completo_foto
      t.integer :sistema_alimentacion_combustible
      t.text :sistema_alimentacion_combustible_observacion
      t.text :sistema_alimentacion_combustible_foto
      t.integer :filtro_combustible
      t.text :filtro_combustible_observacion
      t.text :filtro_combustible_foto
      t.integer :control_fugas_direccion_hidraulica
      t.text :control_fugas_direccion_hidraulica_observacion
      t.text :control_fugas_direccion_hidraulica_foto
      t.integer :otros_altura_total
      t.text :otros_altura_total_observacion
      t.text :otros_altura_total_foto
      t.integer :rodamiento_mazas_rueda
      t.text :rodamiento_mazas_rueda_observacion
      t.text :rodamiento_mazas_rueda_foto
      t.integer :holgura_partes_suspension_rueda
      t.text :holgura_partes_suspension_rueda_observacion
      t.text :holgura_partes_suspension_rueda_foto
      t.integer :control_neumaticos_desgaste_presion
      t.text :control_neumaticos_desgaste_presion_observacion
      t.text :control_neumaticos_desgaste_presion_foto
      t.integer :profundidad
      t.text :profundidad_observacion
      t.text :profundidad_foto
      t.integer :presion
      t.text :presion_observacion
      t.text :presion_foto
      t.integer :otros_altura_media
      t.text :otros_altura_media_observacion
      t.text :otros_altura_media_foto
      t.integer :nivel_calidad_aceite_motor
      t.text :nivel_calidad_aceite_motor_observacion
      t.text :nivel_calidad_aceite_motor_foto
      t.integer :filtro_aire
      t.text :filtro_aire_observacion
      t.text :filtro_aire_foto
      t.integer :filtro_polen
      t.text :filtro_polen_observacion
      t.text :filtro_polen_foto
      t.integer :filtro_pcv
      t.text :filtro_pcv_observacion
      t.text :filtro_pcv_foto
      t.integer :valvula_pcv
      t.text :valvula_pcv_observacion
      t.text :valvula_pcv_foto
      t.integer :bujias_encendido
      t.text :bujias_encendido_observacion
      t.text :bujias_encendido_foto
      t.integer :cables_bujias_bobinas_ignicion
      t.text :cables_bujias_bobinas_ignicion_observacion
      t.text :cables_bujias_bobinas_ignicion_foto
      t.integer :nivel_anticongenlante
      t.text :nivel_anticongenlante_observacion
      t.text :nivel_anticongenlante_foto
      t.integer :tapon_radiador
      t.text :tapon_radiador_observacion
      t.text :tapon_radiador_foto
      t.integer :mangueras_sistema
      t.text :mangueras_sistema_observacion
      t.text :mangueras_sistema_foto
      t.integer :desempeño_ventilador
      t.text :desempeño_ventilador_observacion
      t.text :desempeño_ventilador_foto
      t.integer :calidad_liquido_limpiaparabrisas
      t.text :calidad_liquido_limpiaparabrisas_observacion
      t.text :calidad_liquido_limpiaparabrisas_foto
      t.integer :calidad_aceite_direccion_hidraulica
      t.text :calidad_aceite_direccion_hidraulica_observacion
      t.text :calidad_aceite_direccion_hidraulica_foto
      t.integer :calidad_aceite_transmision_bayoneta
      t.text :calidad_aceite_transmision_bayoneta_observacion
      t.text :calidad_aceite_transmision_bayoneta_foto
      t.integer :liquido_bateria_condiciones
      t.text :liquido_bateria_condiciones_observacion
      t.text :liquido_bateria_condiciones_foto
      t.integer :bandas_poly_v
      t.text :bandas_poly_v_observacion
      t.text :bandas_poly_v_foto
      t.integer :poleas_banda
      t.text :poleas_banda_observacion
      t.text :poleas_banda_foto
      t.integer :banda_tiempo
      t.text :banda_tiempo_observacion
      t.text :banda_tiempo_foto
      t.integer :otros_habitaculo_motor
      t.text :otros_habitaculo_motor_observacion
      t.text :otros_habitaculo_motor_foto
      t.integer :reset_intervalo_servicio
      t.text :reset_intervalo_servicio_observacion
      t.text :reset_intervalo_servicio_foto
      t.integer :ajuste_tornillos_neumaticos_torquimetro
      t.text :ajuste_tornillos_neumaticos_torquimetro_observacion
      t.text :ajuste_tornillos_neumaticos_torquimetro_foto
      t.integer :limpiar_libricar_puertas_cerraduras
      t.text :limpiar_libricar_puertas_cerraduras_observacion
      t.text :limpiar_libricar_puertas_cerraduras_foto
      t.integer :completar_plan_mantenimiento
      t.text :completar_plan_mantenimiento_observacion
      t.text :completar_plan_mantenimiento_foto
      t.string :Fecha
      t.integer :IdEmpleado
      t.integer :IdVehiculo
      t.integer :Id_ordendeservicio
      t.string :NumeroSerie
      t.string :TiempoTranscurrido
      t.integer :id_checklist
      t.integer :Activo

      t.timestamps
    end
  end
end
