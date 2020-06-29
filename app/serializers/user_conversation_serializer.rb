class UserConversationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :conversation_id, :user_id
end
