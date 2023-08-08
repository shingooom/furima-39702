class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    #@items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @error_messages = @item.errors.full_messages
      render :new
    end
  end

  #def destroy
    #item = Item.find(params[:id])
    #item.destroy
    #redirect_to root_path
  #end

  def edit
  end

  #def update
    #item = Item.find(params[:id])
    #item.update(item_params)
    #redirect_to root_path
  #end

  def show
  end

  private
  def item_params
    params.require(:item).permit(:name, :detail, :category_id, :ship_fee_id, :region_id, :ship_day_id, :status_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  #def move_to_index
  #  unless user_signed_in?
  #    redirect_to action: :index
  #  end
  #end

end
