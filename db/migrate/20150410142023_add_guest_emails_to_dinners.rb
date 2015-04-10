class AddGuestEmailsToDinners < ActiveRecord::Migration
  def change
    add_column :dinners, :guest_emails, :string
  end
end
