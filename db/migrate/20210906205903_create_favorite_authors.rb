class CreateFavoriteAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_authors do |t|
      t.integer :author_id
      t.integer :user_id

      t.timestamps
    end
  end
end
