class BoysController < ApplicationController


	before_action :find_boy, :only => [:show, :destroy]

	def index
		@boys = Boy.all
	end

	def show
		#@girl_friends = @boy.girl_friends
	end

	def destroy
		if @boy.destroy!
			redirect_to root_path, :notice => {:status => "success", :message => "Successfully Deleted"}
		else
			redirect_to root_path, :notice => {:status => "error", :message => "Deletion Failed"}
		end
	end

	def find_boy
		@boy = Boy.find(params[:id].to_i)

	end

end
