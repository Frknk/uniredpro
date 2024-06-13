class AddFacultyRefToUsers < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :faculty, null: false, foreign_key: true
  end
end
