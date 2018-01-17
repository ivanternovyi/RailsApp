class AdminController < ApplicationController

  before_action :check_if_admin

  def info
    @users = User.all.order(:email)
    @items = Item.all.order(:name)
    # here will be info about products
  end

end
