class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.reference :listing

      t.timestamps null: false
    end
  end
end
