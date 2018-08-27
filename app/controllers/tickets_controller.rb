class TicketsController < ApplicationController
  before_action :set_project
  before_action :set_ticket, only: [:show, :update, :edit, :destroy]

  def new
    @ticket = @project.tickets.build
  end

  def create
    @ticket = @project.tickets.build(ticket_params)

    if @ticket.save
      flash[:notice] = 'Ticket has been created'
      redirect_to project_ticket_path(@project, @ticket)
    else
      flash[:alert] = 'Ticket has not been created'
      render 'new'
    end
  end

  def show
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_ticket
    @ticket = @project.tickets.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:name, :description)
  end
end