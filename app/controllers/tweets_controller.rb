class TweetsController < ApplicationController
  before_action :require_user_logged_in!

  def index
    @twitter = Current.user.tweets
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Current.user.tweets.new(tweet_params)
    if @tweet.save
      redirect_to tweets_path
      flash[:notice] = "Your Tweet has been scheduled successfully My Very Best"
    else
      render :new
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:twitter_account_id, :body, :publish_at)
  end
end
