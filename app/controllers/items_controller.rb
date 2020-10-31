class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_params, only: [:show, :edit, :update]

  def index
    @items = Item.order(id: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    unless current_user == @item.user
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:title, :text, :category_id, :status_id, :delivery_id, :area_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end

  def find_params
    @item = Item.find(params[:id])
  end

end
