class CreateSocials < ActiveRecord::Migration[7.1]
  def change
    create_table :socials do |t|
      t.string :whatsapp
      t.string :facebook
      t.string :telegram
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
