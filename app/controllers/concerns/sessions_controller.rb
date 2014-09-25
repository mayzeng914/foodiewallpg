class SessionsController < ApplicationController

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