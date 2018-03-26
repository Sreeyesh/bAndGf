class BoysController < ApplicationController


	before_action :find_boy, :only => [:show, :destroy, :edit, :update]

	def index
		@boys = Boy.all
	end

	def show
		#@girl_friends = @boy.girl_friends
	end

	def edit
		
	end

	def update
		update_boy_success = @boy.update(boy_params)

		respond_to do |format|
			format.html{
				if update_boy_success
					redirect_to root_path, :notice => {:status => "success", :message => "Successfully Updated Boy"}
				else
					redirect_to new_boy_path, :notice => {:status => "error", :message => "Boy Updation Failed"}
				end
			}
		end
	end

	def new
		@boy = Boy.new
	end

	def create
		new_boy = Boy.new(boy_params)

		new_boy_success = new_boy.save

		respond_to do |format|
			format.html{
				if new_boy_success
					redirect_to root_path, :notice => {:status => "success", :message => "Successfully Created New Boy"}
				else
					redirect_to new_boy_path, :notice => {:status => "error", :message => "New Boy Creation Failed"}
				end
			}
		end
	end

	def destroy
		if @boy.destroy!
			redirect_to root_path, :notice => {:status => "success", :message => "Successfully Deleted"}
		else
			redirect_to root_path, :notice => {:status => "error", :message => "Deletion Failed"}
		end
	end

	private

	def find_boy
		@boy = Boy.find(params[:id].to_i)
	end

	def boy_params
		params.require(:boy).permit(:first_name, :last_name, :email)
	end

end
