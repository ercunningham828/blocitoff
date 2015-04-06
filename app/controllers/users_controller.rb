class UsersController < ApplicationController
  def show
    @user=User.find(current_user)
    @items=@user.items
    @item =Item.new
  end
end
