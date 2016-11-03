class RemoveFileFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :file, :string
    add_column :users, :file_id, :string
  end
end
