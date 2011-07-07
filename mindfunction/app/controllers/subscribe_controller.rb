class SubscribeController < ApplicationController
	def create	
		@subs = Subscribe.new(params[:subscribe])
		if @subs.save
			redirect_to :back
		 else
        		
      		end		
	end	
end
