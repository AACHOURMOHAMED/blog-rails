class CreatePost < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.integer :comments_counter, default: 0, null: false
      t.integer :likes_counter, default: 0, null: false

      t.timestamps
    end
  end
end
