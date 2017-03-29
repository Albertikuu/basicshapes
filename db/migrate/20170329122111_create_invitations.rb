class CreateInvitations < ActiveRecord::Migration[5.0]
  def change
    create_table :invitations do |t|
      t.string :email
      t.string :team_slug
      t.integer :sender_id
      t.integer :recipient_id
      t.string :token
      t.timestamps
    end
  end
end
