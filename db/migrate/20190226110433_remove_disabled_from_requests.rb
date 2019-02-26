class RemoveDisabledFromRequests < ActiveRecord::Migration[5.2]
  def change
    remove_column :requests, :disabled, :boolean
  end
end
