class PasswordResetsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user.present?
      #send email notification
      PasswordMailer.with(user: @user).reset.deliver_now
    end
    redirect_to root_path flash[:notice] = "If You are not trying to trick me My Very Best, an email would be sent to you to change your password"
  end

  def edit
    begin
      @user = User.find_signed(params[:token], purpose: "password_reset")
    rescue
      redirect_to root_path
      flash[:alert] = "Your token has expired My Dear, try again will you?"
    end
  end

  def update
    @user = User.find_signed(params[:token], purpose: "password_reset")
    if @user.update(password_params)
      redirect_to sign_in_path flash[:notice] = "My Very Best Your Passord Was Changed Successfully"
    else
      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
