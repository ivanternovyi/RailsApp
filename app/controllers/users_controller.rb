class UsersController < ApplicationController

    before_action :find_user,      only: [:show, :edit, :destroy]
    before_action :get_all_users,  only: [:index, :create]

    def index
    end

    def new
      $current_user = User.new
    end

    def show
        unless @user
            render_404
        end
        if  @user.login != $current_user.login
            render_403
        end
    end

    def edit
    end

    def create
        $current_user = User.new(users_params)
        for i in 0..@users.length
          if @users[i] && @users[i].login == $current_user.login && @users[i].password == $current_user.password
            $current_user = @users[i]
            greet_and_redirect
            return
          end
        end
        if $current_user.save
          greet_and_redirect
        else
            flash[:error] = "Input is invalid, try again!"
            redirect_to root_path
        end
    end

    def destroy
        @user.destroy
        redirect_to root_path
    end

    private

    def find_user
         @user = User.where(id: params[:id]).first
         render_404 unless @user
    end

    def get_all_users
        @users = User.all
    end

    def greet_and_redirect
      flash[:success] = "Hi, #{$current_user.login}!"
      redirect_to items_path
   end

   def users_params
      params.require(:user).permit!
   end
end
