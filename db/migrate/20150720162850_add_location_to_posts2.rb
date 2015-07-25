class AddLocationToPosts2 < ActiveRecord::Migration
  def change
  	add_column :post2s, :location, :string
  end
end
