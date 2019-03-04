class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @message  = Message.new(message_params)
    @user     = User.find(params[:message][:receiver_id])
    @message.save!
    redirect_to root_path
  end

  private

  def message_params
    params.require(:message).permit(:body, :sender_id, :receiver_id)
  end
end
