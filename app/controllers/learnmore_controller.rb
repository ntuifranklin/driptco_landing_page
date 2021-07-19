class LearnmoreController < ApplicationController
	def index
		@visitor = Visitor.new	
	end
	
	def create
		flash.clear
		@visitor = Visitor.new(allowed_visitor_params)
		email = params[:visitor][:email]
		captcha_message = "The data you entered for the CAPTCHA wasn't correct.  Please try again"
		if !verify_recaptcha(model: @visitor, message: captcha_message) 
			flash[:alert] = captcha_message
			render :index
                elsif Visitor.exists?(email: email)
	           flash[:alert] = "Thanks again ! You already subscribed ! "
		   render :thankyou
		elsif @visitor.save
                      flash[:alert] = "Thanks for Subscribing ! We will be in touch !"
                      render :thankyou
                elsif @visitor.errors.any?
                      render :index
                else
	              # flash.clear
		      render :index
		end
		
	end # end create 

	def thankyou

	end
	
	def visitorslist
	
	end 
	
	def login
	     @user = User.new	
	end

	def processlogin
		flash.clear
		@user = User.new(allowed_visitorslist_params) 
                email = params[:user][:email]
                pass = params[:user][:password] 
                captcha_message = "The data you entered for the CAPTCHA wasn't correct.  Please try again"
                if !verify_recaptcha(model: @user, message: captcha_message)

		   flash[:alert] = captcha_message

		elsif User.exists?(email:email)
 
		   @user = User.find_by(email: email)
 
		   if !@user.nil? 
	             @visitors = Visitor.all
		   else
		     @user = nil
		     @visitors = nil
		   end

		end

		render :visitorslist
	end 


	private


	def allowed_visitor_params
	   params.require(:visitor).permit(:email, :city, :state)
	end


	def allowed_visitorslist_params
	   params.require(:user).permit(:email, :password)
	end

end
