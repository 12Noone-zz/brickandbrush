class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.boolean :is_featured
      t.attachment :avatar

      t.timestamps null: false
      
    end
  end
end
