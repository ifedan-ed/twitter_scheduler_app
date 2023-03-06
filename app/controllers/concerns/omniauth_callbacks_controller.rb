class OmniauthCallbacksController < ApplicationController
  def twitter
    render plain: "You were Successfull Earthling!"
  end
end
