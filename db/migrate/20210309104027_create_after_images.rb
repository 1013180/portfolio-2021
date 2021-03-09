class CreateAfterImages < ActiveRecord::Migration[5.2]
  def change
    create_table :after_images do |t|
      t.string :after_image_id
      t.integer :shoe_id

      t.timestamps
    end
  end
end
