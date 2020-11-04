class BuyHistoriesController < ApplicationController
  before_action :find_params, only: [:index, :create]

  def index
    @user_buy = UserBuy.new
  end

  def create
    @user_buy = UserBuy.new(buy_params)
    # binding.pry
    if @user_buy.valid?
      pay_item
      @user_buy.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def buy_params
    params.require(:user_buy).permit(:item_id, :post_num, :area_id, :city_name, :city_num, :building_name, :phone_num).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: buy_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def find_params
    @item = Item.find(params[:item_id])
     
  end
end
