class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :title, null: false
      t.text :body, null: false
      t.integer :bar_id, null: false
      t.integer :user_id, null: false
      t.integer :rating, null: false
      t.timestamps
    end
  end
end
