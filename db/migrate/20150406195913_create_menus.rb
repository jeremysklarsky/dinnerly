class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.integer :dinner_id
      t.string :name
      t.timestamps null: false
    end
  end
end
