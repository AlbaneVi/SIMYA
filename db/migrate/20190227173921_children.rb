class Children < ActiveRecord::Migration[5.2]
  def change
    create_table :children do |t|
      t.string :first_name
      t.string :last_name
      t.date   :birthday
    end
  end
end
