class AddMostrarNombreToPublicacions < ActiveRecord::Migration[7.1]
  def change
    add_column :publicacions, :mostrar_nombre, :boolean
  end
end
