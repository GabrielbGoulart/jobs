class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :set_applications, only: [:show, :destroy]

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    job = Job.new(job_params)

    if job.save
      redirect_to jobs_path, notice: "Criado com sucesso!"
    else
      redirect_to new_job_path, alert: "Erro"
    end
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to jobs_path, notice: "Atualizado com sucesso! URU"
    else
      redirect_to edit_job_path(@job.id), alert: "DEU ERRO AI"
    end
  end

  def show
  end

  def destroy
    Job.find(@job).destroy
    redirect_to jobs_path, notice: 'Vaga deletada'
  end

  private
  def job_params
    params.require(:job).permit(:title, :description, :value)
  end

  def set_job
    @job = Job.includes(:applications).find(params[:id])
  end

  def set_applications
    @applications = @job.applications

  end
end
