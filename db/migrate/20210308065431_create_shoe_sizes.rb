class CreateShoeSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :shoe_sizes do |t|
      t.text :size
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
