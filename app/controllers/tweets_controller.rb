class TweetsController < ApplicationController
  before_action :require_user_logged_in!

  def index
    @twitter = Current.user.tweets
  end
end
