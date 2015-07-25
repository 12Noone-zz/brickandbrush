class AddImageColumn < ActiveRecord::Migration
  def up
    add_attachment :posts, :image
  end
end
