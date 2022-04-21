class UsersController < ApplicationController
    before_action :is_admin, only: [:new, :create, :edit, :update, :verify, :revoke]
    
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
        @user.update_column('is_approved', true)
        if @user.is_approved?
            redirect_to users_path
        end
    end

    def revoke
        @user = User.find(params[:id])
        @user.update_column('is_approved', false)
        if !@user.is_approved?
            redirect_to users_path
        end
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
        params.require(:user).permit(:first_name, :middle_name, :last_name, :mobile, :birthday, :is_approved, :password, :current_password, {roles: []})
    end
end
