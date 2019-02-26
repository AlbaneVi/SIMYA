class RenameReferenceFromRequests < ActiveRecord::Migration[5.2]
  def change
    rename_column :requests, :children_id, :child_id
  end
end
