class Api::V1::ConversationsController < ApplicationController
  def index
    render json: ConversationSerializer.new(Conversation.all)
  end

  def create
    conversation = Conversation.create()
    # byebug
    if conversation.valid?
      UserConversation.create(
        conversation_id: conversation.id, 
        user_id: conversation_params[:sender_id]
      )
      UserConversation.create(
        conversation_id: conversation.id, 
        user_id: conversation_params[:receiver_id]
        )
      # serialized_data = ActiveModelSerializers::Adapter::Json.new(
      #   ConversationSerializer.new(conversation)
      # ).serializable_hash

      # testing this code for FastJSON API needs
      serialized_data = ConversationSerializer.new(conversation)

      ActionCable.server.broadcast "current_user_#{current_user.id}", serialized_data
      ActionCable.server.broadcast "current_user_#{conversation_params[:receiver_id]}", serialized_data
      head :ok
    end
  end
  
  private
  
  def conversation_params
    params.permit(:sender_id, :receiver_id) #.require(:conversation)
  end

end
