class EmailSanitizer

  def self.clean_emails(guest_emails, dinner)
    dinner = dinner
    emails = guest_emails.select{|email| email.length > 1}
    emails.each do |email|
      dinner.guest_emails << "," + email.strip
    end    
    dinner.save

    recipients = emails.collect do |email|
      email.strip
    end
  end
  # => returns recipients
end