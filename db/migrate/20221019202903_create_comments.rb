class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :posts, null: false, foreign_key: true
      t.references :users, null: false, foreign_key: true
      t.string :Text

      t.timestamps
    end
  end
end
