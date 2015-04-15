class Api::UsersController < ApiController
  before_action :authenticated?
  def create
    user = User.new(user_params)
    raise "not authorized" unless UserPolicy.new(@logged_user, user).create?
     if user.save
       render json: user.to_json
     else
       render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
     end
  end

  def index
    users=User.all
   render json: users, each_serializer: UserSerializer 
 end

 def destroy
     begin
       user = User.find(params[:id])
        raise "not authorized" unless UserPolicy.new(@logged_user, user).destroy?
       user.destroy
      render json: {}, status: :no_content
     rescue ActiveRecord::RecordNotFound
       render :json => {}, :status => :not_found
     end
   end

 private
   def user_params
     params.require(:user).permit(:email, :password)
   end
end
