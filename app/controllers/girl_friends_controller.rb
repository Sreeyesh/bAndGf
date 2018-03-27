class GirlFriendsController < ApplicationController

	before_action :find_girl_friend, :only => [:show, :destroy, :edit, :update]

	before_action :find_boy

	def new
		@girl_friend = GirlFriend.new
	end

	def create
		new_girl_friend = @boy.girl_friends.new(girl_friend_params)

		new_new_girl_friend_success = new_girl_friend.save

		respond_to do |format|
			format.html{
				if new_new_girl_friend_success
					redirect_to boy_path(@boy.id), :notice => {:status => "success", :message => "Successfully Created New Girl Friend"}
				else
					redirect_to new_boy_girl_friend_path(@boy.id), :notice => {:status => "error", :message => "New Girl Friend Creation Failed"}
				end
			}
		end
	end


	def destroy
		if @girl_friend.destroy!
			redirect_to boy_path(@boy.id), :notice => {:status => "success", :message => "Girl Friend Successfully Deleted"}
		else
			redirect_to boy_path(@boy.id), :notice => {:status => "error", :message => "Girl Friend Deletion Failed"}
		end
	end

		def update
		update_gf_success = @girl_friend.update(girl_friend_params)

		respond_to do |format|
			format.html{
				if update_gf_success
					redirect_to boy_path(@boy.id), :notice => {:status => "success", :message => "Successfully Updated Girl Friend"}
				else
					redirect_to edit_boy_girl_friend_path, :notice => {:status => "error", :message => "Girl Friend Updation Failed"}
				end
			}
		end
	end

	private

	def find_boy
		@boy = Boy.find(params[:boy_id].to_i)
	end

	def find_girl_friend
		@girl_friend = GirlFriend.find(params[:id].to_i)
	end

	def girl_friend_params
		params.require(:girl_friend).permit(:first_name, :last_name, :email)
	end

end
