class AddElectionToMenus < ActiveRecord::Migration
  def change
    add_column :menus, :election, :boolean
  end
end
