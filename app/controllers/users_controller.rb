class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @items = @user.items if @user.present?
  end
end
