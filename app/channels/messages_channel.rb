class MessagesChannel < ApplicationCable::Channel
  def subscribed
    conversation = Conversation.find(params[:conversation])
    stream_for conversation
  end

  def unsubscribed
    stop_all_streams
  end
end
