class FriendshipsController < ApplicationController


	def destroy
		@friendship = Friendship.where( user_id: current_user, friend_id: params[:friend_id])

		    if  @friendship.destroy(@friendship)
		    respond_to do |format|
		      format.html { redirect_to my_friends_path, notice: 'Unfollowed Chef.' }
		      format.json { head :no_content }
		    end
	    end
	end


end