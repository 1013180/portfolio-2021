class CreateShoesBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :shoes_brands do |t|
      t.string :brand_name, null: false 
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
