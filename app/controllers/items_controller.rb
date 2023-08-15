class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :redirect_unless_owner, only: [:edit, :update, :destroy]

  def index
    @items = Item.order('created_at DESC')
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

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      flash[:alert] = 'Error deleting item!'
      redirect_to item_path(@item)
    end
  end

  def edit
    @item = Item.find(params[:id])
    return unless current_user.id != @item.user_id || @item.sold_out?

    redirect_to root_path
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:name, :detail, :category_id, :ship_fee_id, :region_id, :ship_day_id, :status_id, :price,
                                 :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def redirect_unless_owner
    redirect_to root_path unless current_user.id == @item.user_id
  end
end
