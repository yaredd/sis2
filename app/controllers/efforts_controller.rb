class EffortsController < ApplicationController
  # GET /efforts
  # GET /efforts.json
  def index
    @efforts = Effort.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @efforts }
    end
  end

  # GET /efforts/1
  # GET /efforts/1.json
  def show
    @effort = Effort.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @effort }
    end
  end

  # GET /efforts/new
  # GET /efforts/new.json
  def new
    @effort = Effort.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @effort }
    end
  end

  # GET /efforts/1/edit
  def edit
    @effort = Effort.find(params[:id])
  end

  # POST /efforts
  # POST /efforts.json
  def create
    @effort = Effort.new(params[:effort])

    respond_to do |format|
      if @effort.save
        format.html { redirect_to @effort, notice: 'Effort was successfully created.' }
        format.json { render json: @effort, status: :created, location: @effort }
      else
        format.html { render action: "new" }
        format.json { render json: @effort.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /efforts/1
  # PUT /efforts/1.json
  def update
    @effort = Effort.find(params[:id])

    respond_to do |format|
      if @effort.update_attributes(params[:effort])
        format.html { redirect_to @effort, notice: 'Effort was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @effort.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /efforts/1
  # DELETE /efforts/1.json
  def destroy
    @effort = Effort.find(params[:id])
    @effort.destroy

    respond_to do |format|
      format.html { redirect_to efforts_url }
      format.json { head :ok }
    end
  end
end
