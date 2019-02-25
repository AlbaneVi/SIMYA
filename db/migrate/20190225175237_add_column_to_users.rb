class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :phone, :string
    add_reference :users, :child, foreign_key: true
    add_column :users, :avatar, :string
  end
end
