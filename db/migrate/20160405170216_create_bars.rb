class CreateBars < ActiveRecord::Migration
  def change
    create_table :bars do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.belongs_to :user, null: false
    end
  end
end
