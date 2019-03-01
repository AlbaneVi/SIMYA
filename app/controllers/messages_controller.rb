class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @sender   = current_user
    @receiver = User.where(child_id: current_user.child_id).where.not(id: current_user.id).first
    p "rediriger vers 'inviter l'autre parent" if @receiver.nil?
    @message  = Message.new
    @messages = Message.all
  end

  def create
    @message  = Message.new(message_params)
    @user     = User.find(params[:message][:receiver_id])

    if @message.save!
      redirect_to messages_path
    else
      @message
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :sender_id, :receiver_id)
  end
end
