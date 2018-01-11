namespace :my_namespace do
desc "This task is called by the Heroku scheduler add-on"
task :update_ticker => :environment do
  puts "Updating tickerss..."
  Ticker.update
  puts "Ticker updated."
end



task :send_alert => :environment do
  
end
end