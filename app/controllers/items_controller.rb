class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
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
    def show
      @comment = Comment.new
      @comments = @item.items.includes(:user)
      @user = @item.user
      @items = @user.prototypes
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :responsibility_id, :region_id,
                                 :time_id, :price).merge(user_id: current_user.id)
  end
end
