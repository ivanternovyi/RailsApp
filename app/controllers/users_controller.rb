class UsersController < ApplicationController

    before_action :find_user,      only: [:show, :edit, :destroy]
    before_action :get_all_users,  only: [:index, :create]

    def index
      @users = User.all
    end

    def new
      @user = User.new
    end

    def show
        unless @user
            render :text => "Page not found!", status: 404
        end
    end

    def edit
    end

    def create
        @parameters = params.require(:user).permit(:login, :password)
        @user = User.new(@parameters)
        for i in 0..@users.length
          if @users[i] && @users[i].login == @user.login
            redirect_to items_path
            return
          end
        end
        if @user.save
            redirect_to items_path
        else
            redirect_to new_user_url
        end
    end

    def destroy
        @user.destroy
        redirect_to action: "index"
    end

    private

    def find_user
         @user = User.where(id: params[:id]).first
         render_404 unless @user
    end

    def get_all_users
      @users = User.all
    end
end
