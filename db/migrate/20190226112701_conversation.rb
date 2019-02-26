class Conversation < ActiveRecord::Migration[5.2]
  def change
    create_table :conversations do |t|
      t.bigint :sender
      t.bigint :receiver

      t.timestamps
    end
  end
end
