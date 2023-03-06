class TwitterAccountsController < ApplicationController
  before_action :require_user_logged_in!

  def index
    @twitter_accounts = Current.user.twitter_accounts
  end

  def destroy
    @twitter_account = Current.user.twitter_accounts.find(params[:id])
    @twitter_account.destroy
    redirect_to twitter_accounts_path flash[:notice] = "Attention Earthling, You Have Succesfully Deleted Your Account - @#{@twitter_account.username}"
  end
end
