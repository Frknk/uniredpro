class AddFotoperfilAndDescripcionperfilToSocials < ActiveRecord::Migration[7.1]
  def change
    add_column :socials, :fotoperfil, :string
    add_column :socials, :descripcionperfil, :text
  end
end
