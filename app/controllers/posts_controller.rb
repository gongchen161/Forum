class PostsController < ApplicationController
  layout "main"

  def index
  end

  def show
    @post = Post.find(params[:id])
    @reply = Reply.new(:post_id => @post.id)
  end

  def new
    @subject = Subject.find(params[:subject_id])
    @post = Post.new(:subject_id => @subject.id)
  end

  def create
    @subject = Subject.find(params[:subject_id])
    @post = Post.new(postParams)
    @post.numLikes = 0
    @post.numReplies = 0
    @post.subject_id = @subject.id;
    if @post.save
      flash[:notice] = "Post created successfully."
      redirect_to(post_path(@post, :subject_id => @subject.id))
    else
      render('new')
    end
  end

  def edit
  end

  def delete
  end

private
  def postParams
    params.require(:post).permit(:subject_id, :title, :content, :numLikes, :numPosts)
  end
end
