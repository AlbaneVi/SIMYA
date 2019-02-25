class CreateResidencies < ActiveRecord::Migration[5.2]
  def change
    create_table :residencies do |t|
      t.date :date_start
      t.date :date_end
      t.references :users, foreign_key: true
      t.references :transitions, foreign_key: true

      t.timestamps
    end
  end
end
