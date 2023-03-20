class LikesController < ApplicationController

  def create
    @like = current_user.likes.new(like_params)
    @post = @like.post
    redirect_to post_likes_path(@post)
    if !@like.save
      flash[:notice] = @like.errors.full_messages.to_sentence
    end
   
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    @post = @like.post
    @like.destroy
    redirect_to post_likes_path(@post)
  end

  def index
    @post = Post.find(params[:post_id])
    @likes = @post.likes
    
  end

  private
  def like_params
    params.require(:like).permit(:post_id)
  end
end
