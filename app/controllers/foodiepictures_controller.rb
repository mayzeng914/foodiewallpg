class FoodiepicturesController < ApplicationController
	before_action :login, :signup, :comment_post

	def index
		@foodiepictures = Foodiepicture.all
		@form_type = params[:form_type]

	end

	def show
		if current_user
		@foodiepicture = Foodiepicture.find(params[:id])
		@id = params[:id]
	    else
	       redirect_to foodiepictures_path
	    end
	end

	def new
		if !current_user
			redirect_to foodiepictures_path
			return
		end
		@foodiepicture = Foodiepicture.new
	end

	def create
		if !current_user
			redirect_to foodiepictures_path
			return
		end
		foodiepicture = current_user.foodiepictures.new( params.require(:foodiepicture).permit(:image, :description) )
		if foodiepicture.save
			redirect_to foodiepictures_path
		end
	end

	def login
	  	@user_login = User.new
	  	@is_login = true
  	end

  	def signup
  	    @user = User.new
    end

    def comment_post
    	@comment_post = Comment.new
    end

	def edit
		@foodiepicture = Foodiepicture.find(params[:id])
		if (!current_user) || (@foodiepicture.user != current_user)
			redirect_to user_path(current_user)
			return
		end
	end

	def update
		@foodiepicture = Foodiepicture.find(params[:id])
		if (!current_user) || (@foodiepicture.user != current_user)
			redirect_to foodiepictures_path
			return
		elsif (@foodiepicture.user == current_user)
			if @foodiepicture.update_attributes(params.require(:foodiepicture).permit(:image, :description) )
				redirect_to user_path(current_user)
			else
				render 'edit'
			end
		else
			redirect_to foodiepictures_path
		end
	end

	def destroy
		@foodiepicture = Foodiepicture.find(params[:id])
		if (@foodiepicture.user == current_user)
			@foodiepicture.destroy
		 	redirect_to user_path(current_user)
		else
		 	redirect_to foodiepictures_path
		end
	end
end
