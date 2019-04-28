class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by_email params[:email]
        if user&.authenticate params[:password]
            session[:user_id] = user.id
            flash[:info] = 'Logged in'
            redirect_to root_path
        else
            flash[:info] = "Wrong email or password"
            render :new
        end
    end
    
    def destroy
        session[:user_id] = nil
        flash[:info] = 'Logged out'
        redirect_to root_path 
    end
end
