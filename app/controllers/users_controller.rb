class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @prototypes = @user.items if @user.present?
  end
end
