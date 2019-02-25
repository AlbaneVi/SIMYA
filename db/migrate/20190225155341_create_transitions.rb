class CreateTransitions < ActiveRecord::Migration[5.2]
  def change
    create_table :transitions do |t|
      t.date :date
      t.time :hour
      t.string :place

      t.timestamps
    end
  end
end
