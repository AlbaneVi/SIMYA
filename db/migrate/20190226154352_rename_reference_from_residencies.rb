class RenameReferenceFromResidencies < ActiveRecord::Migration[5.2]
  def change
    rename_column :residencies, :users_id, :user_id
    rename_column :residencies, :transitions_id, :transition_id
  end
end
