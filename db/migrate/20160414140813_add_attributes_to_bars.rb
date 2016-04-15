class AddAttributesToBars < ActiveRecord::Migration
  def change
    add_column :bars, :street, :string, null: false
    add_column :bars, :city, :string, null: false
    add_column :bars, :state, :string, null: false
    add_column :bars, :zip, :string, null: false
    add_column :bars, :phone, :string, null: false
    add_column :bars, :website, :string
  end
end
