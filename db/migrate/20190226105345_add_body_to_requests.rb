class AddBodyToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :body, :string
  end
end
