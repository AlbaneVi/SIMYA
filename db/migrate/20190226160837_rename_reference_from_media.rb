class RenameReferenceFromMedia < ActiveRecord::Migration[5.2]
  def change
    rename_column :media, :events_id, :event_id
  end
end
