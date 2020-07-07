class ConversationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "current_user_#{current_user.id}" #check on connection.rb
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
