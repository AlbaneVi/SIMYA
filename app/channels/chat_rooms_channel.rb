class ChatRoomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "child_id_#{params[:child_id]}"
  end
end
