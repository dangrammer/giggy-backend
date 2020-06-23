class MessageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :conversation_id, :user_id, :text, :created_at
end
