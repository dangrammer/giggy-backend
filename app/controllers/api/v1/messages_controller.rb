class Api::V1::MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    conversation = Conversation.find(message_params[:conversation_id])
    
    if message.save
      # serialized_data = ActiveModelSerializers::Adapter::Json.new(
      #   MessageSerializer.new(message)
      # ).serializable_hash

      # testing this code for FastJSON API needs
      serialized_data = MessageSerializer.new(message)

      MessagesChannel.broadcast_to conversation, serialized_data
      head :ok
    end
  end
  
  private
  
  def message_params
    params.require(:message).permit(:text, :conversation_id, :user_id)
  end
end
