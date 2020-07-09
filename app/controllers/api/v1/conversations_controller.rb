class Api::V1::ConversationsController < ApplicationController
  def index
    render json: ConversationSerializer.new(Conversation.all)
  end

  def create
    # byebug
    conversation = Conversation.create()
   
    if conversation.valid?
      UserConversation.create(
        conversation_id: conversation.id, 
        user_id: conversation_params[:sender_id]
      )
      UserConversation.create(
        conversation_id: conversation.id, 
        user_id: conversation_params[:receiver_id]
      )

      serialized_data = ConversationSerializer.new(conversation)
      
      # ActionCable.server.broadcast "current_user_#{conversation_params[:sender_id]}", serialized_data
      # ActionCable.server.broadcast "current_user_#{conversation_params[:receiver_id]}", serialized_data
      ConversationsChannel.broadcast_to("current_user_#{conversation_params[:sender_id]}", serialized_data)
      ConversationsChannel.broadcast_to("current_user_#{conversation_params[:receiver_id]}", serialized_data)
      head :ok
    end
  end
  
  private
  
  def conversation_params
    params.permit(:conversation, :sender_id, :receiver_id) #.require(:conversation)
  end

end
