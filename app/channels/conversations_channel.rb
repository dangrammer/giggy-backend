class ConversationsChannel < ApplicationCable::Channel
  def subscribed
    # byebug
    stream_from "current_user_#{current_user.id}" #check on connection.rb
  end

  def unsubscribed
    stop_all_streams
  end
end
