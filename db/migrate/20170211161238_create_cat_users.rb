class CreateCatUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :cat_users do |t|
    	t.references :user, index: true
    	t.references :category, index: true
        t.timestamps
    end
  end
end
