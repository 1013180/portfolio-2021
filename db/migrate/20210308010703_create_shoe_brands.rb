class CreateShoeBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :shoe_brands do |t|
      t.string :brand_name, null: false
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
