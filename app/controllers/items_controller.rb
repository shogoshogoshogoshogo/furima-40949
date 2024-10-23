class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy, :purchase]
  before_action :redirect_if_not_owner_or_sold_out, only: [:edit, :update, :destroy]

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

  private

  def set_item
    @item = Item.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = '商品が見つかりませんでした'
    redirect_to root_path
  end

  def redirect_if_not_owner_or_sold_out
    return unless current_user != @item.user || @item.sold_out?

    redirect_to root_path, alert: 'Edit action forbidden'
  end

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :responsibility_id, :region_id,
                                 :delivery_time_id, :price).merge(user_id: current_user.id)
  end
end
