class ToppagesController < ApplicationController
  def index
    if logged_in?
      @micropost = current_user.microposts.build
      # @micropost = Micropost.new
      # @micropost.user = current_user
      @microposts = current_user.feed_microposts.order(id: :desc).page(params[:page])
      # @microposts = Micropost.where(user: current_user).order(id: :desc).page(params[:page])
    end
  end
end
