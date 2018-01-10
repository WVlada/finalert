desc "This task is called by the Heroku scheduler add-on"
task :update_ticker => :environment do
  puts "Updating tickerss..."
  Ticker.update
  puts "Ticker updated."
end


# advanced usage
#task :send_alert => :environment do
#  Email.alert_me
#end