class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :title
      t.string :subtitle
      t.string :author
      t.text :content
      t.datetime :publish_at

      t.timestamps null: false
    end

    add_index :posts, :user_id
    add_index :posts, [:publish_at, :created_at]
  end
end