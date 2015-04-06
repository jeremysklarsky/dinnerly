class CreateDinnerGuests < ActiveRecord::Migration
  def change
    create_table :dinner_guests do |t|
      t.integer :guest_id
      t.integer :dinner_id
      t.timestamps null: false
    end

    add_index :dinner_guests, :guest_id
    add_index :dinner_guests, :dinner_id
    add_index :dinner_guests, [:guest_id, :dinner_id], unique: true

  end
end
