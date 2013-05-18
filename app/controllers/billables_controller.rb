class BillablesController < ApplicationController
  def index
    @billable = Billable.all
  end

  def show
    @billable = Billable.find(params[:id])
  end
  
  def edit
    @billable = Billable.find(params[:id]) 
  end

  def update
    @billable = Billable.where(:id => params[:id]).first


    respond_to do |format|
      if @billable.update_attributes(params[:billable])
        format.html { redirect_to new_billable_path, :notice => 'You have clocked out' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @billable.errors, :status => :unprocessable_entity }
      end
    end
  end  

  def new
    @billable = Billable.new
  end

  def create
    @billable = Billable.new(params[:billable])
    if @billable.save
      flash[:success] = "You have clocked in"
      redirect_to (edit_billable_path(@billable.id))
    else
      redirect_to (:back)
    end
  end
  
  def destroy
    @billable.destroy
  end
end
