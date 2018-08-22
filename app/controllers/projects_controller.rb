class ProjectsController < ApplicationController
  def index
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      # flash[:notice] = "Project has been successfully created"
      redirect_to @project, notice: "Project has been created"
    else
      # if the validations on the model fail, run the
      # code which is here
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
