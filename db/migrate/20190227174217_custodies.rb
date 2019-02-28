class Custodies < ActiveRecord::Migration[5.2]
  def change
    create_table :custodies do |t|
      t.date        :day_on
      t.string      :title
      t.text        :text
      t.references  :user
    end
  end
end
