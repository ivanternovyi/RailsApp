class AddOmniauthToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :facebook, :string
    add_column :users, :uid, :string
  end
end
