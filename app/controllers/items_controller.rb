require "resolv-replace.rb"

class ItemsController < ApplicationController

  before_action :find_item, only: %i[show edit update destroy upvote add_to_cart]
  before_action :check_if_admin, only: [:destroy]

  def index
     # UserNotifierMailer.welcome(User.first).deliver_now
    @items = Item.all
    @maxPrice = @items.map(&:price).max
    @minPrice = @items.map(&:price).min
    @maxVotes = @items.map(&:votes_count).max
    @minVotes = @items.map(&:votes_count).min
    @items = Item.search(params[:term], params[:page])
    if params[:search]
      # DESC descending
      # @items = Active Record Relation
      @items = @items.where('price >= ?', params[:search][:price_from])       if params[:search][:price_from]
      @items = @items.where('price <= ?', params[:search][:price_to])         if params[:search][:price_to]
      @items = @items.where('votes_count >= ?', params[:search][:votes_from]) if params[:search][:votes_from]
      @items = @items.where('votes_count <= ?', params[:search][:votes_to])   if params[:search][:votes_to]
    end
    if params[:find_item]
      @items = @items.where('name == ?', params[:find_item][:name_param])     if params[:find_item][:name_param]
    end
  end

  # /items/1 GET
  def show
    render text: 'Page not found!', status: 404 unless @item
  end

  # /items/new GET
  def new
    # in order to save hints after non-valid input
    @item = Item.new
  end

  # /items/1/edit GET
  def edit; end

  # /items POST
  def create
    @item = Item.create(item_params)
    if @item.errors.empty?
      redirect_to item_path(@item)
    else
      render :new
    end
    # Need item[variable] in the url zone
    # @item = Item.create(params[:item])
  end

  # /items/1 PUT
  def update
    @item.update_attributes(item_params)
    if @item.errors.empty?
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  # GET - render
  # /items/1 DELETE(POST)
  def destroy
    @item.destroy
    redirect_to action: :index
    # ItemsMailer.item_destroyed(@item).deliver_now
  end

  def upvote
    if session[:votes].nil?
      @item.increment!(:votes_count)
      session[:votes] = true
    else
      flash[:notice] = 'You can`t upvote more than 1 time!'
    end
    redirect_to action: :index
  end

  def add_to_cart
    @cart.add_item(@item, 1)
    redirect_to action: :index
  end

  private

  def find_item
    @item = Item.where(id: params[:id]).first
    render_404 unless @item
  end

  def item_params
    params.require(:item).permit(:name, :price, :real, :description, :weight, :image)
  end
end
