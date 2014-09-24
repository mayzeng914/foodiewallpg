class SessionsController < ApplicationController

    def index
      #@sessions = Session.all
      #@sessions = Session.where(:user_id => current_user.id)
      #@totalnum = @sessions.count
      
      # sql statement 
      sqlstring = 'SELECT sessions.user_id, users.name, count(*) as "logins" FROM sessions JOIN users on sessions.user_id = users.id 
                   group by sessions.user_id, users.name ORDER BY count(*) DESC LIMIT 3'
      @sessions = Session.find_by_sql(sqlstring)      
    end

    def show
      if current_user
        @session = Session.all

        # where(user_id: [current_userid])
        # binding.pry

      end


    end

	  def create
    	u = User.where(name: params[:user][:name]).first
    	if u && u.authenticate(params[:user][:password])
    		if u.is_active == false
    			redirect_to reactivate_user_path(u.id)
    		else
    			session[:user_id] = u.id.to_s
          session[:name] = u.name.to_s
          session[:image] = u.image
          params[:user_id] = u.id
          @session = Session.new(u.id)
          if @session.save
      			redirect_to foodiepictures_path
          end
    		end
    	else
    		redirect_to foodiepictures_path
    	end
    end

  def destroy
  	reset_session
  	redirect_to foodiepictures_path
  end
  
end