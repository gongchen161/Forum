class SubjectsController < ApplicationController

  before_action :confirm_logged_in, :except => [:index, :show]

  layout 'main'

  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new()
  end

  def create
    @subject = Subject.new(subjectParams)
    @subject.numPosts = 0;
    if @subject.save
      flash[:notice] = "Subject created successfully"
      redirect_to(subjects_path)
    else
      flash.now[:notice] = @subject.errors.full_messages
      render('new')
    end
  end

  def edit
  end

  def update
  end

  def delete
    confirm_level
    @subject = Subject.find(params[:id])
  end

  def destroy
    confirm_level
    @subject = Subject.find(params[:id])
    @subject.posts.each {|post|
      post.replies.each { |reply| reply.destroy }
      post.destroy
    }
    @subject.destroy

    flash[:notice] = "Subject '#{@subject.name}' destroyed"
    redirect_to("/")
  end

private
  def subjectParams
    params.require(:subject).permit(:name, :numPosts)
  end
end
