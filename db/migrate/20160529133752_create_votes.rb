class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :listing_id
    end
  end
end
