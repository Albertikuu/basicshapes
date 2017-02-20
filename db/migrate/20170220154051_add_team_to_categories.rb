class AddTeamToCategories < ActiveRecord::Migration[5.0]
  def change
  	 add_column :categories, :team_id, :integer
  end
end
