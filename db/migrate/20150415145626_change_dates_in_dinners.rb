class ChangeDatesInDinners < ActiveRecord::Migration
  def change
    remove_column :dinners, :datetime
    add_column :dinners, :date, :date
    add_column :dinners, :time, :time
  end
end
