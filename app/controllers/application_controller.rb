class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  before_action :set_cart
  # before_action :authenticate_user!


  private

  def set_cart
    @cart = Cart.find(session[:cart_id]) if session[:cart_id]
    unless @cart
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end

  def set_locale
    I18n.locale = params[:locale]
  end

  def self.default_url_options(options = {})
    options.merge(locale: I18n.locale)
  end

  def render_403
    render file: 'public/403.html', status: 403
  end

  def render_404
    render file: 'public/404.html', status: 404
  end

  def check_if_admin
    render_403 unless current_user && user_admin?
  end
end
