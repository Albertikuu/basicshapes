class CreateCatUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :cat_users do |t|

      t.timestamps
    end
  end
end
