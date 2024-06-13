class AddFijadaToPublicacions < ActiveRecord::Migration[7.1]
  def change
    add_column :publicacions, :fijada, :boolean, default: false
  end
end
