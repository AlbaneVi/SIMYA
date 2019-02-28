class Messages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text       :body
      t.datetime   :send_at
      t.references :receiver, foreign_key: {to_table: :users}
      t.references :sender, foreign_key: {to_table: :users}
      t.boolean    :read, default: false
    end
  end
end
