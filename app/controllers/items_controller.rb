class ItemsController < ApplicationController
  def create
    @user=current_user
    @item = current_user.items.build(item_params)
    @new_item=Item.new

    if @item.save
       flash[:notice] = "Item was saved."
     else
       flash[:error] = "There was an error saving the item. Please try again."
     end

     respond_to do |format|
      format.html
      format.js
    end
  end


  private

  def item_params
    params.require(:item).permit(:name)
  end
end
