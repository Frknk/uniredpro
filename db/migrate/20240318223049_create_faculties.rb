class CreateFaculties < ActiveRecord::Migration[7.1]
  def change
    create_table :faculties do |t|
      t.string :name

      t.timestamps
    end

    add_index :faculties, :name, unique: true
  end
end
