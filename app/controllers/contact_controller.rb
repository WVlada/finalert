class ContactController < ApplicationController
    
    

	def create
		NotificationsMailer.new_message(@message).deliver
	end
end
