class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:purchase_address).permit(:postcode, :region_id, :city, :street, :building, :phone).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,       
      card: purchase_params[:token],   
      currency: 'jpy'           
    )
  end
end
