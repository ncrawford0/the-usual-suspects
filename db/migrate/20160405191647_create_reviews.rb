class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :title, null: false
      t.text :body, null: false
      t.integer :rating, null: false
      t.belongs_to :bar, null: false
      t.belongs_to :user, null: false

      t.timestamps
    end
  end
end
