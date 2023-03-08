class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :twitter_account
  validates :body, presence: true, length: { minimum: 1, maximum: 278 }
  validates :publish_at, presence: true
  after_initialize do
    self.publish_at ||= 2.hours.from_now
  end

  def published?
    tweet_id?
  end

  after_save_commit do
    if publish_at_previously_changed?
      TweetJob.set(wait_until: publish_at).perform_later(self)
    end
  end

  def publish_to_twitter!
    tweet = twitter_account.client.update(body)
    update(tweet_id: tweet.id)
  end
end
