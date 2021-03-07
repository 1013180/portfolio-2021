class CreateShoeImages < ActiveRecord::Migration[5.2]
  def change
    create_table :shoe_images do |t|
      t.integer :shoe_id
      t.string :image_id

      t.timestamps
    end
  end
end
