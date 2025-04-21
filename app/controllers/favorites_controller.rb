class FavoritesController < ApplicationController

   def create
    post = Post.find(params[:post_id])
    @favorite = current_user.favorites.new(post: post)

    if @favorite.save
      flash[:notice] = "お気に入りに追加しました"
    else
      flash[:alert] = "お気に入りの追加に失敗しました"
    end
    
    redirect_to post_path
   end
   
   def destroy
    post = Post.find(params[:post_id])
    @favorite = current_user.favorites.find_by(post: post)
     if @favorite.destroy
      @favorite.destroy
      flash[:notice] = "お気に入りを削除しました"
    else
      flash[:alert] = "お気に入りの削除に失敗しました"
    end
    
    redirect_to post_path
   end
  
end
