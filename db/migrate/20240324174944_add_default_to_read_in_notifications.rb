class AddDefaultToReadInNotifications < ActiveRecord::Migration[7.1]
  def change
    change_column_default :notifications, :read, default: false
  end
end
