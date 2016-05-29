class CreateVoters < ActiveRecord::Migration
  def change
    create_table :voters do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :voted
      t.string :token

      t.timestamps null: false
    end
  end
end
