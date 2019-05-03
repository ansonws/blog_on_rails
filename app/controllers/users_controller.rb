class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:edit, :show, :update, :password, :password_update]
    before_action :find_user, only: [:edit, :show, :update, :password, :password_update]
    before_action :authorize, only: [:edit, :update, :password, :password_update]

    def new
        @user = User.new
    end

    def create
        @user = User.new user_params
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path
        else
            flash[:danger] = @user.errors.full_messages.join(', ')
            redirect_to signup_path
        end
    end

    def edit
       
    end

    def password

    end

    def password_update
        if @user&.authenticate params[:user][ :current_password ]
            if @user.update user_params
                flash[:success] = "Password updated"
                redirect_to user_path
            else
                flash[:danger] = @user.errors.full_messages.join(', ')
                redirect_to request.referrer
            end
        else
            flash[:danger] = "You've entered an invalid current password"
            redirect_to request.referrer    
        end
    end

    def update
        if @user.update user_params
            flash[:success] = "Profile updated"
            redirect_to user_path
        else
            flash[:danger] = @user.errors.full_messages.join(', ')
            redirect_to request.referrer
        end
    end

    def show
    end
    
    private

    def find_user
        @user = User.find params[:id]
    end

    def user_params
       params.require(:user).permit(
           :name,
           :email, 
           :password, 
           :password_confirmation
        )
    end

    def authorize
        unless can? :crud, @user
            flash[:danger] = "Not Authorized"
            redirect_to request.referrer
        end
    end
end
