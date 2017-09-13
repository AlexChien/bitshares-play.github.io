class AddNicknameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :display_name, :string, required: true
  end
end
