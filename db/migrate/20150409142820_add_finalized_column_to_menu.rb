class AddFinalizedColumnToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :finalized, :boolean, :default => false
  end
end
