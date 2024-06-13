class AddFotoperfilToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :fotoperfil, :string
  end
end
