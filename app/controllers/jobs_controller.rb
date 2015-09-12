class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    job = Job.new(jobs_params)
    if job.save
      redirect_to jobs_path, bla: "Criado com sucesso!"
    else
      redirect_to new_job_path, alert: "Erro"
    end
  end

  def edit
  end

  def update
    if @job.update(jobs_params)
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

  def jobs_params
    params.require(:job).permit(:title, :description)
  end

  def set_job
    @job = Job.find(params[:id])
  end

end
