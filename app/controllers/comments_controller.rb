class CommentsController < ApplicationController
	def create

		puts "***********"

		# when on a particular photo page
		if params[:foodie_id]

			# find the particular photo
			@foodiepicture = Foodiepicture.find(params[:foodie_id])

			# attach new comment for this photo
			@comment_on_pic = @foodiepicture.comments.new(params.require(:comment).permit(:comment))
			# also attach comment to the current user
			@comment_on_pic.user_id = current_user.id

			if @comment_on_pic.save
				redirect_to foodiepicture_path(@foodiepicture.id)
			end

		# when on a particular user's wall
		else params[:userwall_id]

			# find the particular user's wall (user_id on the address)
			@user = User.find(params[:userwall_id])

			# attach new comment to the particular user wall
			@comment_on_user = @user.comments.new(params.require(:comment).permit(:comment))
			# also attach comment to the current user
			# @comment_on_user.user_id = @current_user.id

			if @comment_on_user.save
				redirect_to user_path(@user.id)
			end
		end
	end
end
