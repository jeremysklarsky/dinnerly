class AddDefaultValueToDinners < ActiveRecord::Migration
  def change
    change_column_default :dinners, :guest_emails, ""
  end
end
