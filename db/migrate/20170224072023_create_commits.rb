class CreateCommits < ActiveRecord::Migration[5.0]
  def change
    create_table :commits do |t|
    	t.string :title
    	t.string :message
    	
      t.timestamps
    end
  end
end
