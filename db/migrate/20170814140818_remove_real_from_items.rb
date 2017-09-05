class RemoveRealFromItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :real, :boolean
  end
end
