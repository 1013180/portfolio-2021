class CreateShoes < ActiveRecord::Migration[5.2]
  def change
    create_table :shoes do |t|
      t.integer :user_id
      t.integer :shoes_size_id, null: false
      t.integer :shoes_brand_id, null: false
      t.integer :tag_id
      t.integer :comment_id
      t.integer :favorite_id
      t.text :description
      t.string :shoes_models
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
