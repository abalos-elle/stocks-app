class UsersController < ApplicationController
    before_action :is_admin, only: [:new, :create, :edit, :update, :verify]
    
    # Admin: User Management
    def index
        @users = User.where(roles: [:trader, :user])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to users_path
        else
            render :new
        end
    end
    
    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to users_path
        else
            render :edit
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_path
    end

    def verify
        @user = User.find(params[:id])
        if @user.is_approved?
            @user.update_attribute(:is_approved, false)
        else
            @user.update_attribute(:is_approved, true)
        end
        redirect_to users_path
    end
        
    protected
    def is_admin
        if current_user
          if current_user.has_roles?(:admin)
            true
          else
            redirect_to forbidden_path
          end
        else
          redirect_to new_user_session_path
        end
    end

    def user_params
        params.require(:user).permit(:first_name, :middle_name, :last_name, :mobile, :birthday, :is_approved, {roles: []})
    end
end
