class AddFijadaindexToPublicacions < ActiveRecord::Migration[7.1]
  def change
    add_column :publicacions, :fijadaindex, :boolean
  end
end
