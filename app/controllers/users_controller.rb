class UsersController < ApplicationController
	before_action :login, :comment_post

  def index
    #@sessions = Session.all
    #@sessions = Session.where(:user_id => current_user.id)
    #@totalnum = @sessions.count

    # sql statement for querying the top 3 active users
    most_login = 'SELECT sessions.user_id, users.name, count(*) as "logins" FROM sessions JOIN users on sessions.user_id = users.id 
                 group by sessions.user_id, users.name ORDER BY count(*) DESC LIMIT 3'
    @sessions = Session.find_by_sql(most_login)      
  end

  def create
  	@user = User.new(params.require(:user).permit(:name, :password, :password_confirmation, :image))
    @foodiepictures = Foodiepicture.all
    respond_to do |format|

        

      if @user.save

            session[:user_id] = @user.id.to_s
            format.html { redirect_to foodiepictures_path }

      else
        
        format.html { redirect_to foodiepictures_path, notice: @user.errors.full_messages.to_a.first }
      end
    end
  end

  def show
  	@user = User.find(params[:id])
    @foodiepictures = @user.foodiepictures
  end

  def comment_post
    @comment_post = Comment.new
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params:id)
  	if current_user != @user
  		if current_user
  			redirect_to user_path(current_user)
  		else
  			redirect_to new_path
  		end
  	elsif 
  		@user.update_attributes(params.require(:user).permit(:name, :password, :is_active))
  		redirect_to user_show_path
  	else
  		render :edit
  	end
  end

  def destroy
  	User.find(params[:id])
  	@user.is_active = false
  	@user.save
  	redirect_to users_path
  end

  def login
    @user_login = User.new
    @is_login = true
  end
end
