class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :conversations, :sender, :sender_id
    rename_column :conversations, :receiver, :receiver_id
  end
end
