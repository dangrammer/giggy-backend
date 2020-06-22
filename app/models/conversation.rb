class Conversation < ApplicationRecord
  has_many :messages
  has_many :users, through: :user_conversations
end
