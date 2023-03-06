class OmniauthCallbacksController < ApplicationController
  def twitter
    twitter_account = Current.user.twitter_accounts.where(username: auth.info.nickname).first_or_initialize
    twitter_account.update(
      name: auth.info.name,
      username: auth.info.nickname,
      image: auth.info.image,
      token: auth.credentials.token,
      secret: auth.credentials.secret,
    )
    redirect_to twitter_accounts_path
    flash[:notice] = "You have Successfully Connected Your Account My Very Best"
  end

  def auth
    auth ||= request.env["omniauth.auth"]
  end
end
