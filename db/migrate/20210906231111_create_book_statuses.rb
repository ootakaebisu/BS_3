class CreateBookStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :book_statuses do |t|
      t.integer :book_id
      t.integer :user_id
      t.integer :status

      t.timestamps
    end
  end
end
