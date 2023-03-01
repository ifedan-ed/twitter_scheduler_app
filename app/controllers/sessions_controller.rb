class SessionsController < ApplicationController
  def destroy
    session[:user_id] = nil
    flash[:notice] = "Successfully Logged Out My Very Best!."
    redirect_to root_path
  end
  def new

  end
  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
      flash[:notice] = "You are successfully logged in Earthling!"
    else
      flash[:alert] = "Your email or password is incorrect my very best"
      render :new
    end

  end
end
