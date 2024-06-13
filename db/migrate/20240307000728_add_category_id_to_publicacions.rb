class AddCategoryIdToPublicacions < ActiveRecord::Migration[7.1]
  def change
    add_reference :publicacions, :category, null: false, foreign_key: true
  end
end
