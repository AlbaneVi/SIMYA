class AddTimestampsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :created_at, :datetime
  end
end
