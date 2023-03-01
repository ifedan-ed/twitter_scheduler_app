class RegistrationsController < ApplicationController
def new
  @user = User.new
end

def create
 @user = User.new(user_params)
 if @user.save
  session[:user_id] = @user.id
  flash[:notice] = "Successfully created Account."
  redirect_to root_path

 else
  flash[:alert] = "Something went wrong"
  render :new
 end
end

def user_params
  params.require(:user).permit(:email, :password, :password_confirmation)
end


end
