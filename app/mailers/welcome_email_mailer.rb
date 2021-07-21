class WelcomeEmailMailer < ApplicationMailer
	default from: 'no_reply@driptco.com'

	def welcome_email
		@visitor = params[:visitor]
		@url = 'http://driptco.com/signup'
		mail(to: @visitor.email, subject: 'Welcome to DRIPT') 
	end
end
