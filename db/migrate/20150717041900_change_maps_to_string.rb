class ChangeMapsToString < ActiveRecord::Migration
  def change
    change_column :posts, :maps, :string
  end
end
