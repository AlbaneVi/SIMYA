class AddConversationIdToRequests < ActiveRecord::Migration[5.2]
  def change
    add_reference :requests, :conversation, foreign_key: true
  end
end
