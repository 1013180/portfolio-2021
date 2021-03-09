class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :shoe_id
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
