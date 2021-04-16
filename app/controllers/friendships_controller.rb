class FriendshipsController < ApplicationController

	def create
		friend = User.find(params[:friend])
		current_user.friendships.build(friend_id: friend.id)
		if current_user.save
			flash[:notice] = "Now following #{friend.full_name}!"
			redirect_to my_friends_path
		else
			flash[:alert] = "There was an error with the tracking request."
			redirect_to my_friends_path
		end
	end

	def destroy
		friend = User.find(params[:id])
		friendship = Friendship.where(user_id: current_user.id, friend_id: params[:id]).first
		friendship.destroy
		flash[:notice] = "You have successfully removed #{friend.full_name} as a friend!"
		redirect_to my_friends_path
	end

end