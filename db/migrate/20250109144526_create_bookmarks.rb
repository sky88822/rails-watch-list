class CreateBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :bookmarks do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :list, null: false, foreign_key: true
      t.text :comment, null: false

      t.timestamps
    end

    add_index :bookmarks, [:movie_id, :list_id], unique: true
  end
end
