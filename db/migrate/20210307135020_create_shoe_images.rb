class CreateShoeImages < ActiveRecord::Migration[5.2]
  def change
    create_table :shoe_images do |t|
      t.integer :shoe_id
      t.string :before_image_id
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
