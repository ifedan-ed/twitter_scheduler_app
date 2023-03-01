class MainController < ApplicationController
  def index
    flash[:notice] = "You are successfully logged in!"
    flash[:alert] = "Invalid username, email or password!"
  end
end
