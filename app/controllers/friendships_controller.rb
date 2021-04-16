class FriendshipsController < ApplicationController

	def destroy
		friend = User.find(params[:id])
		friendship = Friendship.where(user_id: current_user.id, friend_id: friend.id).first
		friendship.destroy
		flash[:notice] = "You have successfully removed #{friend.name} as a friend!"
		redirect_to my_friends_path
	end

end