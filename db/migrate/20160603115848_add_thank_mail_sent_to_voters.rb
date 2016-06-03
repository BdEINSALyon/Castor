class AddThankMailSentToVoters < ActiveRecord::Migration
  def change
    add_column :voters, :thank_mail_sent, :boolean
  end
end
