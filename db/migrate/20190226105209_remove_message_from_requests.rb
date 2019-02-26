class RemoveMessageFromRequests < ActiveRecord::Migration[5.2]
  def change
    remove_column :requests, :message, :string
  end
end
