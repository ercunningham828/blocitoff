class Api::ListsController < ApiController 
  before_action :authenticated?

  
    
  def create
    user = User.find(params[:user_id])
    list=user.lists.build(list_params)
    list.user=user
    raise "not authorized" unless ListPolicy.new(@logged_user, list).create?
    if list.save
      render json: list.to_json
    else
      render json: {errors: list.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
     begin
      list = List.find(params[:id])
      items=list.items
      list.destroy
    raise "not authorized" unless ListPolicy.new(@logged_user, list).destroy?
      render json: {}, status: :no_content
     rescue ActiveRecord::RecordNotFound
       render :json => {}, :status => :not_found
     end
   end

   def update
   list = List.find(params[:id])
   raise "not authorized" unless ListPolicy.new(@logged_user, list).update?
   if list.update(list_params)
     render json: list.to_json
   else
     render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
   end
 end

  private

  def list_params
    params.require(:list).permit(:name,:description)
  end
end
