class EmailSanitizer

  def self.clean_emails(guest_emails, dinner)
    dinner = dinner
    emails = guest_emails.select {|email| email.length > 1}
    emails.each {|email| dinner.guest_emails << "," + email.strip}
    dinner.save
    recipients = emails.collect {|email| email.strip}
  end
  
end