class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.string :message
      t.date :date_start
      t.date :date_end
      t.string :status
      t.references :children, foreign_key: true

      t.timestamps
    end
  end
end
