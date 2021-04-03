class CreateShoes < ActiveRecord::Migration[5.2]
  def change
    create_table :shoes do |t|
      t.integer :user_id
      t.integer :shoe_size_id, null: false
      t.integer :shoe_brand_id, null: false
      t.integer :comment_id
      t.integer :favorite_id
      t.text :description
      t.string :shoe_model
      t.decimal :score, precision: 5, scale: 3
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
