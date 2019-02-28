class Medias < ActiveRecord::Migration[5.2]
  def change
    create_table :media do |t|
      t.string     :photo
      t.references :custody
    end
  end
end
