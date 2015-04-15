class Api::ItemsController < ApiController
  before_action :authenticated?

  def index
    list=List.find(params[:list_id])
    items=list.items
    render json: items, each_serializer: ItemSerializer 
  end


  def destroy
     begin
      item=Item.find(params[:id])
      item.destroy
    raise "not authorized" unless ItemPolicy.new(@logged_user, item).update?

      render json: {}, status: :no_content
     rescue ActiveRecord::RecordNotFound
       render :json => {}, :status => :not_found
     end
   end

   def update
   item=Item.find(params[:id])
   user=item.list.user
   raise "not authorized" unless ItemPolicy.new(@logged_user, item).update?
   if item.update(item_params)
     render json: item.to_json
   else
     render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
   end
  end

  def create
    list = List.find(params[:list_id])
    item=list.items.build(item_params)
    item.list=list
    user=list.user
    item.user=list.user
    raise "not authorized" unless ItemPolicy.new(@logged_user, item).update?
    if item.save
      render json: item.to_json
    else
      render json: {errors: item.errors.full_messages}, status: :unprocessable_entity
    end
  end

  private
   def item_params
     params.require(:item).permit(:name)
   end
end
