class RepliesController < ApplicationController

  before_action :confirm_logged_in

  def new
    @post = Post.find(params[:post_id])
    @reply = Reply.new(:post_id => @post.id)
    @reply.numLikes = 0;
  end

  def create
   @post = Post.find(params[:post_id])
   @reply = Reply.new(replyParams)
   @reply.numLikes = 0;
   @reply.post_id = @post.id;
   @reply.user_id = session[:user_id]

   if @reply.save
      flash[:notice] = "Post created successfully."
      @reply.user.numThreads += 1
      @reply.user.save
      redirect_to(post_path(@post))
  end

  end

  def delete
    confirm_level
    @reply = Reply.find(params[:id])
  end


  def destroy
    confirm_level
    @reply = Reply.find(params[:id])
    @post = @reply.post
    @reply.destroy
    flash[:notice] = "Reply destroyed"
    redirect_to(post_path(@post));
  end

private
  def replyParams
    params.require(:reply).permit(:post_id, :content, :numLikes)
  end

end
