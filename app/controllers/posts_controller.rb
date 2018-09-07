class PostsController < ApplicationController
  layout "main"

  before_action :confirm_logged_in, :except => [:index, :show]

  def index
  end

  def show
    @post = Post.find(params[:id])
    @subject = Subject.find(params[:subject_id])
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
    @post.user_id = session[:user_id]
    if @post.save
      flash[:notice] = "Post created successfully."
      @post.user.numThreads += 1
      @post.user.save
      redirect_to(post_path(@post, :subject_id => @subject.id))
    else
      flash[:notice] = @post.errors.full_messages
      render('new')
    end
  end

  def edit
  end

  def delete
    confirm_level
    @post = Post.find(params[:id])
  end

  def destroy
    confirm_level
    @post = Post.find(params[:id])
    @subject = @post.subject
    @post.replies.each { |reply| reply.destroy }
    @post.destroy
    flash[:notice] = "Post '#{@post.title}' destroyed"
    redirect_to(subject_path(@subject));
  end

private
  def postParams
    params.require(:post).permit(:subject_id, :title, :content, :numLikes, :numPosts)
  end
end
