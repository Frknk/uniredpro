class RemoveFacultyFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :faculty, :string
  end
end
