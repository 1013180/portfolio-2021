class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :shoe_id
      t.text :comment
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
