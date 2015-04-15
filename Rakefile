# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

desc "Assigns boolean values to recipe courses"
task :sanitize => :environment do 
  UpdateCourseNames.new.update
end

desc "check for expired elections, tally expired elections and email"
task :tally_and_email_guests => :environment do
  
end
