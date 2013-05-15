class JobsController < ApplicationController
  def index
    @job = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end
  
  def edit
    @job = Job.find(params[:id]) 
  end

  def update
    @job = Job.where(:id => params[:id]).first


    respond_to do |format|
      if @job.update_attributes(params[:job])
        format.html { redirect_to jobs_path, :notice => 'This seller was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @job.errors, :status => :unprocessable_entity }
      end
    end
  end  

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(params[:job])
    if @job.save
      flash[:success] = "New Job Created!"
      redirect_to (jobs_path)
    else
      redirect_to (:back)
    end
  end
  
  def destroy
    @job.destroy
  end
end
