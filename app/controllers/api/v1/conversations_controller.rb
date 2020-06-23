class Api::V1::ConversationsController < ApplicationController
  def index
    render json: CategorySerializer.new(Conversation.all)
  end

  def create
    conversation = Conversation.new(conversation_params)
    if conversation.save

      # serialized_data = ActiveModelSerializers::Adapter::Json.new(
      #   ConversationSerializer.new(conversation)
      # ).serializable_hash

      # testing this code for FastJSON API needs
      serialized_data = CategorySerializer.new(conversation)
      
      ActionCable.server.broadcast 'conversations_channel', serialized_data
      head :ok
    end
  end
  
  private
  
  def conversation_params
    params.require(:conversation).permit(:id)
  end
end
