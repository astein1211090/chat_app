class ChatRoom < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy
  after_create_commit { MessageBroadcastJob.perform_later(self) }
end
