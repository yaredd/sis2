class GradesController < ApplicationController
  load_and_authorize_resource
  
  # GET /grades
  # GET /grades.json
  def index
    @grades = Grade.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @grades }
    end
  end

  # GET /grades/1
  # GET /grades/1.json
  def show
    @grade = Grade.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @grade }
    end
  end

  # GET /grades/new
  # GET /grades/new.json
  def new
    @grade = Grade.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @grade }
    end
  end

  # GET /grades/1/edit
  def edit
    @grade = Grade.find(params[:id])
  end

  # POST /grades
  # POST /grades.json
  def create
    @grade = Grade.new(params[:grade])
    @grade.grading_period = Period.current_grading_period # TODO: must allow admin to enter grades for other periods as well
    # check if the passed schedule_id belongs to the editor or admin
    if Schedule.find(params[:grade][:schedule_id]).teacher.login == current_user.login or current_user.role? :super_admin or current_user.role? :admin
      @grade.schedule_id = params[:grade][:schedule_id]
    end
    respond_to do |format|
      if @grade.save
        format.html { redirect_to @grade, notice: 'Grade was successfully created.' }
        format.json { render json: @grade, status: :created, location: @grade }
      else
        format.html { render action: "new" }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /grades/1
  # PUT /grades/1.json
  def update
    @grade = Grade.find(params[:id])

    respond_to do |format|
      if @grade.update_attributes(params[:grade])
        format.html { redirect_to @grade, notice: 'Grade was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grades/1
  # DELETE /grades/1.json
  def destroy
    @grade = Grade.find(params[:id])
    @grade.destroy

    respond_to do |format|
      format.html { redirect_to grades_url }
      format.json { head :ok }
    end
  end
end
