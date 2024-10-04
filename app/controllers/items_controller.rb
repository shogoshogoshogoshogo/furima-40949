class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_item, only: [:show, :edit, :update]
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
      render :new, status: :unprocessable_entity
    end
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to root_path
  end

  def show
  end

  private

  def set_item
    @item = Item.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = '商品が見つかりませんでした'
    redirect_to root_path
  end

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :responsibility_id, :region_id,
                                 :delivery_time_id, :price).merge(user_id: current_user.id)
  end
end
