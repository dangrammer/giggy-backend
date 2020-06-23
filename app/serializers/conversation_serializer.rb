class ConversationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id
  has_many :messages
end
