class ConversationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id
  has_many :messages
  has_many :users, through: :user_conversations
end
