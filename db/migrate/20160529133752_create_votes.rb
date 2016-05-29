class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.reference :listing
    end
  end
end
