class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :name
      t.text :participants
      t.string :website
      t.string :facebook

      t.timestamps null: false
    end
  end
end
