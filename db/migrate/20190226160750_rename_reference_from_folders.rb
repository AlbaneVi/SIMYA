class RenameReferenceFromFolders < ActiveRecord::Migration[5.2]
  def change
    rename_column :folders, :children_id, :child_id
  end
end
