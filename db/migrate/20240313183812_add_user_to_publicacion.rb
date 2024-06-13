class AddUserToPublicacion < ActiveRecord::Migration[7.1]
  def change
    add_reference :publicacions, :user, null: false, foreign_key: true
  end
end
