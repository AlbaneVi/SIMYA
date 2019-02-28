# class ConversationsController < ApplicationController
#   before_action :authenticate_user!

#   def index
#     @users = User.where.not(id: current_user.id)
#     @conversations = Conversation.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
#   end

#   def create
#     p params[:sender_id].to_i
#     p params[:receiver_id].to_i
#     if Conversation.between(params[:sender_id].to_i, params[:receiver_id].to_i).present?
#       @conversation = Conversation.between(params[:sender_id], params[:receiver_id]).first
#     else
#       @conversation = Conversation.create!(conversation_params)
#     end
#     redirect_to conversation_requests_path(@conversation)
#   end

#   private

#   def conversation_params
#     params.permit(:sender_id, :receiver_id)
#   end
# end
