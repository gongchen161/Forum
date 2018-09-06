class SubjectsController < ApplicationController
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
      render('new')
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  def destroy
  end

private
  def subjectParams
    params.require(:subject).permit(:name, :numPosts)
  end
end
