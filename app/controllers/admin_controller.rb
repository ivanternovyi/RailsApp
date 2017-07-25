class AdminController < ApplicationController

  before_action :check_if_admin
  layout "admin", :only => [:users_count], :except => []

  def users_count
    @users_count = User.count
  end

end
