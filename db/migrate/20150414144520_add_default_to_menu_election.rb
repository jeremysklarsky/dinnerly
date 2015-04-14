class AddDefaultToMenuElection < ActiveRecord::Migration
  def change
    change_column :menus, :election, :boolean, :default => false
  end
end
