class UsersController < ApplicationController

    before_action :find_user,      only: [:show, :edit, :destroy]

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
        @user = User.create(@parameters)
        if @user.errors.empty?
            redirect_to items_path
        else
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
end
