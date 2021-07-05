
class LearnmoreController < ApplicationController
	def index
		@visitor = Visitor.new	
	end
	
	def create
		
		email = params[:visitor][:email]
                if Visitor.exists?(email: email)
	           flash[:alert] = "Thanks again ! You already subscribed ! "
		   render :thankyou
		else
		   @visitor = Visitor.new(allowed_visitor_params)
                   if @visitor.save
                      flash[:alert] = "Thanks for Subscribing ! We will be in touch !"
                      render :thankyou
                   elsif @visitor.errors.any?
                      render :index
                   else
	              flash.clear
		      render :index
		   end
		end
	end # end create 

	def thankyou

	end

	private

	def allowed_visitor_params
	   params.require(:visitor).permit(:email, :city, :state)
	end
end
