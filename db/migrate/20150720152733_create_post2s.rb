class CreatePost2s < ActiveRecord::Migration
  def change
    create_table :post2s do |t|
      t.attachment :image
      t.string :title
      t.string :author
      t.string :map

      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
