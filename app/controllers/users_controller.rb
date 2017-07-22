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
            render :text => "Page not found!", status: 404
        end
    end

    def edit
    end

    def create
        @parameters = params.require(:user).permit(:login, :password)
        $current_user = User.new(@parameters)
        for i in 0..@users.length
          if @users[i] && @users[i].login == $current_user.login && @users[i].password == $current_user.password
            flash[:success] = "Hi, #{$current_user.login}!"
            redirect_to items_path
            return
          end
        end
        if $current_user.save
          flash[:success] = "Hi, #{$current_user.login}!"
          redirect_to items_path
        else
            flash.now[:error] = "Input is invalid, try again!"
            render "new"
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


  #  def success_and_redirect
  #    flash[:success] = "Hi, #{@user.login}!"
  #    redirect_to user_path(@user)
#    end
end
