class SchoolSetupsController < ApplicationController
	load_and_authorize_resource

  # GET /school_setups
  # GET /school_setups.json
  def index
    @school_setups = SchoolSetup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @school_setups }
    end
  end

  # GET /school_setups/1
  # GET /school_setups/1.json
  def show
    @school_setup = SchoolSetup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @school_setup }
    end
  end

  # GET /school_setups/new
  # GET /school_setups/new.json
  def new
    @school_setup = SchoolSetup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @school_setup }
    end
  end

  # GET /school_setups/1/edit
  def edit
    @school_setup = SchoolSetup.find(params[:id])
  end

  # POST /school_setups
  # POST /school_setups.json
  def create
    @school_setup = SchoolSetup.new(params[:school_setup])

    respond_to do |format|
      if @school_setup.save
        format.html { redirect_to @school_setup, notice: 'School setup was successfully created.' }
        format.json { render json: @school_setup, status: :created, location: @school_setup }
      else
        format.html { render action: "new" }
        format.json { render json: @school_setup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /school_setups/1
  # PUT /school_setups/1.json
  def update
    @school_setup = SchoolSetup.find(params[:id])

    respond_to do |format|
      if @school_setup.update_attributes(params[:school_setup])
        format.html { redirect_to @school_setup, notice: 'School setup was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @school_setup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /school_setups/1
  # DELETE /school_setups/1.json
  def destroy
    @school_setup = SchoolSetup.find(params[:id])
    @school_setup.destroy

    respond_to do |format|
      format.html { redirect_to school_setups_url }
      format.json { head :ok }
    end
  end
end
