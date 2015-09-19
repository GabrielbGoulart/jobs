class ApplicationsController < ApplicationController
  before_action :load_job

  def index
    @applications = Applications.all
  end

  def new
    @application = @job.applications.new
  end

  def create
    @application = @job.applications.new(app_params)

    if @application.save
      redirect_to job_path(@job), notice: "Aplicação enviada."
    else
      redirect_to new_job_application_path(@job), notice: "Falha no envio da aplicação."
    end
  end

  def show
    @application = Application.find(params[:id])
  end

  def edit
    @application = @job.applications.find(params[:id])
  end

  def update
    @application = @job.applications.find(params[:id])

    if @application.update(app_params)
      redirect_to job_path(@job), notice: "Aplicação modificada."
    else
      redirect_to edit_job_path(@job), notice: "Não foi possível modificar a aplicação. Tente novamente."
    end
  end

  def destroy
    @application = @job.applications.find(params[:id])

    if @application.destroy
      redirect_to job_path(@job), notice: "Aplicação deletada."
    else
      redirect_to job_path(@job), notice: "Não foi possível deletar a aplicação."
    end
  end

  private
  def load_job
    @job = Job.find(params[:job_id])
  end

  def app_params
    params.require(:application).permit(:name, :email, :reasons)
  end
end
