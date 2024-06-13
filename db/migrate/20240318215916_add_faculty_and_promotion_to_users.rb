class AddFacultyAndPromotionToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :faculty, :string
    add_column :users, :promotion, :string
  end
end
