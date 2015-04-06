class CreateDinners < ActiveRecord::Migration
  def change
    create_table :dinners do |t|
      t.integer :host_id
      t.string :name
      t.datetime :datetime
      t.string :location
      t.timestamps null: false
    end
  end
end
