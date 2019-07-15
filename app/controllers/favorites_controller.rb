class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.favor(micropost)
    # favorite = Favorite.new(user: current_user, micropost: micropost)
    # favorite.save
    flash[:success] = 'お気に入りに登録しました'
    redirect_back(fallback_location: root_url)
  end

  def destroy
    # micropost = Micropost.find(params[:micropost_id])
    # current_user.unfavor(micropost)
    favorite = Favorite.find(params[:id])
    favorite.destroy
    flash[:danger] = 'お気に入りを解除しました'
    redirect_back(fallback_location: root_url)
  end
end
