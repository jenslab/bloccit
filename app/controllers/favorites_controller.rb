class FavoritesController < ApplicationController

  def create
     def create
     @post = Post.find(params[:post_id])
     favorite = current_user.favorites.build(post: @post)
     authorize favorite 
 
     if favorite.save
      flash[:notice] = "Favorited post"
      redirect_to [@post.topic, @post]
     else
       flash[:error] = "Oops, unable to add favorite. Please try again."
       redirect_to [@post.topic, @post]
     end
   end
end

 def destroy
   @post = Post.find(params[:post_id])
   favorite = current_user.favorites.find(params[:id])
   authorize favorite

   if favorite.destroy
     flash[:notice] = "Removed favorite."
     redirect_to [@post.topic, @post]
   else
     flash[:error] = "oops, unable to remove favorite. Please try again."
     redirect_to [@post.topic, @post]
   end
 end
end
