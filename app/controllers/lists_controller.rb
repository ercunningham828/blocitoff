class ListsController < ApplicationController
   def new
    @list=List.new
   end

   def show
    @user=User.find(current_user)
    @list=List.find(params[:id])
    @items=@list.items
    @item =Item.new
   end

   def create
    @user=current_user
    @list= current_user.lists.build(list_params)
    @list.user=@user

    if @list.save
       flash[:notice] = "List was saved."
       redirect_to @list
     else
       flash[:error] = "There was an error saving the list. Please try again."
       render :new
     end
  end

  def edit
    @list = List.find(params[:id])
  end

def update
     @list= List.find(params[:id])
     if @list.update_attributes(list_params)
       flash[:notice] = "List was updated."
       redirect_to @list
     else
       flash[:error] = "There was an error saving the list. Please try again."
       render :edit
     end
   end

  def destroy
     @user = current_user
     @list = List.find(params[:id])
     @items=@list.items
     
    if @list.destroy
      flash[:notice] = "List was deleted."
      redirect_to @user
    else
      flash[:error] = "Item couldn't be deleted. Try again."
      redirect_to @list
    end
  end

   def list_params
      params.require(:list).permit(:name,:description)
    end
end
