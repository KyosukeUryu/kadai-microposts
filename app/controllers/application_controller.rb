class ApplicationController < ActionController::Base
  
  # include モジュール は対象のmodule内のメソッドを、当該classのインスタンスメソッドとして取り込む
  include SessionsHelper
  
  private
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def counts(user)
    @count_microposts = user.microposts.count
    @count_followings = user.followings.count
    @count_followers = user.followers.count
    @count_favor_comments = user.favorite_comments.count
  end
  
end
