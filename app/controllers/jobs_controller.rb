class JobsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @jobs = Job.all
  end
  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      flash[:success] = "Job Created!"
      redirect_to root_path
    else
      flash[:error] = "Could not create job"
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update_attributes(job_params)
      flash[:success] = "Job Updated"
      redirect_to job_path
    else
      flash[:success] = "Could not update job"
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to root_url
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :duties, :close)
  end
end