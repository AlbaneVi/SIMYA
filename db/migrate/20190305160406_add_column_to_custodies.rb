class AddColumnToCustodies < ActiveRecord::Migration[5.2]
  def change
    add_column :custodies, :change_at, :datetime, default: nil
  end
end
