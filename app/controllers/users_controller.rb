class UsersController < ApplicationController
    before_action :is_admin, only: [:new, :create, :edit, :update]
    
    # Admin: User Management
    def index
        @users = User.where(roles: [:user])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to users_path
        else
            render :new_user
        end
    end
    
    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        render 'users/registrations/edit',
            locals: {resource: @user, resource_name: :user}
    end

    def destroy

    end

    def verify_trader
        
    end
    
    # Admin: Update user details
    # def update_user
    #     @user = User.find(params[:id])
    #     if @user.update(user_params)
    #     redirect_to users_path
    #     else
    #     render :edit_user
    #     end
    # end
    
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
