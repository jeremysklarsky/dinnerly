class DailyTally
  #check all dinners 
  #if dinner election is expired, tally (and email)

  def self.tally_and_email
    expired_menus = Menu.where("exp_date < ? AND finalized = ?",  Date.today, false)
    expired_menus.each do |menu|
      menu.tally_votes
      dinner = menu.dinner
      host = menu.dinner.host
      menu.email_guests_with_final_menu(dinner, host)
    end

  end

end