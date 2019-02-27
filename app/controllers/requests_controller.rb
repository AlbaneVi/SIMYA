class RequestsController < ApplicationController
  before_action :authenticate_user!

  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    @conversation.requests.where("user_id != ?", current_user.id)
    @request = @conversation.requests.new
  end

  def create
    @request = @conversation.requests.new(request_params)
    @request.user = current_user
    @request.child_id = current_user.child_id

    if @request.save!
      ActionCable.server.broadcast "Requests", { conversation_id: @conversation.id }
      redirect_to conversation_requests_path(@conversation)
    else
      @request
    end
  end

  private

  def request_params
    params.require(:request).permit(:body, :user_id)
  end
end
