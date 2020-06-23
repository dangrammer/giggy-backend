class ConversationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "current_user_#{current_user.id}" #application_cable needs to be edited to accomodate this
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
