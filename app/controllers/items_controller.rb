class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy, :purchase]
  before_action :redirect_if_not_authorized, only: [:purchase, :edit, :edit]
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
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    return if @item.user == current_user

    redirect_to root_path
  end

  def destroy
    if @item.user != current_user
      redirect_to root_path
    else
      @item.destroy
      redirect_to root_path
    end
  end

  def perchase
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :show, status: :unprocessable_entity
    end
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

  def order_params
    params.require(:order).permit(:postal_code, :region_id, :city, :street, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:id], token: params[:token]
    )
  end
end
