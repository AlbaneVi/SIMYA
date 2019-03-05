class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @message  = Message.new(message_params)
    @user     = User.find(params[:message][:receiver_id])
    @message.save!
    broadcast_message
  end

  private

  def message_params
    params.require(:message).permit(:body, :sender_id, :receiver_id)
  end

  def broadcast_message
    ActionCable.server.broadcast(
      "child_id_#{@user.child.id}",
      message_partial: ApplicationController.renderer.render(
        partial: "shared/message",
        locals: { message: @message, user: current_user }
      ),
      current_user_id: current_user.id
    )
  end
end
