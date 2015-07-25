class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :author
      t.string :content
      t.string :location
      t.float :maps
      t.attachment :image1
      t.attachment :image2
      t.attachment :image3
      t.attachment :image4
      t.attachment :image5

      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
