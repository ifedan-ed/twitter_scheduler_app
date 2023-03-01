class PasswordResetsController < ApplicationController
  def new

  end

  def create
  @user = User.find_by(email: params[:email])
  if @user.present?
    #send email notification
    PasswordMailer.with(user: @user).reset.deliver_later
  end
  redirect_to root_path flash[:notice] = "If You are not trying to trick me My Very Best, an email would be sent to you to change your password"

  end

end
