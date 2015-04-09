class ItemsController < ApplicationController
  def create
    @user=current_user
    @list=List.find(params[:list_id])
    @item = current_user.items.build(item_params)
    @item.user=@user
    @item.list=@list
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

  def destroy
     @user = current_user
     @list = List.find(params[:list_id])
     @item = @list.items.find(params[:id])

    if @item.destroy
      flash[:notice] = "Item was removed."
    else
      flash[:error] = "Item couldn't be deleted. Try again."
    end

     respond_to do |format|
       format.html
       format.js
     end

    
     def item_params
      params.require(:item).permit(:name)
     end
  end


  private

  def item_params
    params.require(:item).permit(:name)
  end
end
