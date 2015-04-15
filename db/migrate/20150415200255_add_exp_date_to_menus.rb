class AddExpDateToMenus < ActiveRecord::Migration
  def change
    add_column :menus, :exp_date, :date
  end
end
