class AddSubstractToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :abstract, :text, null: false
  end
end