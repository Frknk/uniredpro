class NotificationsController < ApplicationController
    def index
      mark_as_read = params[:mark_as_read] == 'true' # Verifica si se debe marcar como leídas
      @notifications = Current.user.notifications.order(created_at: :desc)
      @unread_notifications = Current.user.notifications.where(read: false)
      if mark_as_read
        @unread_notifications.update_all(read: true) # Marca como leídas si es necesario
      end
    end
  end
  