class Api::V1::MessagesController < ApplicationController
  def create
    message = Message.create(message_params)
    conversation = Conversation.find(message_params[:conversation_id])

    if message.valid?
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
