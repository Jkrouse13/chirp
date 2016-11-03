class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.text :chirp
      t.references :user, foreign_key: true
      t.string :file_id

      t.timestamps
    end
  end
end
