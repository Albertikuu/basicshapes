class CreateParticipations < ActiveRecord::Migration[5.0]
  def change
    create_table :participations do |t|
    	t.references :user, index: true
    	t.references :team, index: true
      
      t.timestamps
    end
  end
end
