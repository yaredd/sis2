class StandardsController < ApplicationController
	load_and_authorize_resource
	
  # GET /standards
  # GET /standards.json
  def index
    @standards = Standard.page(params[:page]).search(params[:course_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @standards }
    end
  end

  # GET /standards/1
  # GET /standards/1.json
  def show
    @standard = Standard.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @standard }
    end
  end

  # GET /standards/new
  # GET /standards/new.json
  def new
    @standard = Standard.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @standard }
    end
  end

  # GET /standards/1/edit
  def edit
    @standard = Standard.find(params[:id])
  end

  # POST /standards
  # POST /standards.json
  def create
    @standard = Standard.new(params[:standard])

    respond_to do |format|
      if @standard.save
        format.html { redirect_to @standard, notice: 'Standard was successfully created.' }
        format.json { render json: @standard, status: :created, location: @standard }
      else
        format.html { render action: "new" }
        format.json { render json: @standard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /standards/1
  # PUT /standards/1.json
  def update
    @standard = Standard.find(params[:id])

    respond_to do |format|
      if @standard.update_attributes(params[:standard])
        format.html { redirect_to @standard, notice: 'Standard was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @standard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /standards/1
  # DELETE /standards/1.json
  def destroy
    @standard = Standard.find(params[:id])
    @standard.destroy

    respond_to do |format|
      format.html { redirect_to standards_url }
      format.json { head :ok }
    end
  end

end
