class NotificationsMailer < ActionMailer::Base
  default from: "Rails Web App"
  default to: "vladimir.bukvic@live.com"

  def new_message(message, znak)
  	#@message = message
  	mail(:subject => "[RailsWebAppSite] #{message[:path]} #{znak}")
  end

end
