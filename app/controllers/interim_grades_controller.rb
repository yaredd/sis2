class InterimGradesController < ApplicationController
  # GET /interim_grades
  # GET /interim_grades.json
  def index
    @interim_grades = InterimGrade.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @interim_grades }
    end
  end

  # GET /interim_grades/1
  # GET /interim_grades/1.json
  def show
    @interim_grade = InterimGrade.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @interim_grade }
    end
  end

  # GET /interim_grades/new
  # GET /interim_grades/new.json
  def new
    @interim_grade = InterimGrade.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @interim_grade }
    end
  end

  # GET /interim_grades/1/edit
  def edit
    @interim_grade = InterimGrade.find(params[:id])
  end

  # POST /interim_grades
  # POST /interim_grades.json
  def create
    @interim_grade = InterimGrade.new(:mark_id => params[:interim_grade][:mark_id], :on_task => params[:interim_grade][:on_task], :additional_learning => params[:interim_grade][:additional_learning], :positive_attitude => params[:interim_grade][:positive_attitude], :comes_prepared => params[:interim_grade][:comes_prepared], :attends_class => params[:interim_grade][:attends_class], :comment => params[:interim_grade][:comment])
    @interim_grade.grading_period = Period.current_period  # TODO: must let admin user choose grading period
    # check if the passed schedule_id belongs to the editor or admin
    if Schedule.find(params[:interim_grade][:schedule_id]).teacher.login == current_user.login or current_user.role? :super_admin or current_user.role? :admin
      @interim_grade.schedule_id = params[:interim_grade][:schedule_id]
    end
    respond_to do |format|
      if @interim_grade.save
        format.html { redirect_to @interim_grade, notice: 'Interim grade was successfully created.' }
        format.json { render json: @interim_grade, status: :created, location: @interim_grade }
      else
        format.html { render action: "new" }
        format.json { render json: @interim_grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /interim_grades/1
  # PUT /interim_grades/1.json
  def update
    @interim_grade = InterimGrade.find(params[:id])

    respond_to do |format|
      if @interim_grade.update_attributes(params[:interim_grade])
        format.html { redirect_to @interim_grade, notice: 'Interim grade was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @interim_grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interim_grades/1
  # DELETE /interim_grades/1.json
  def destroy
    @interim_grade = InterimGrade.find(params[:id])
    @interim_grade.destroy

    respond_to do |format|
      format.html { redirect_to interim_grades_url }
      format.json { head :ok }
    end
  end
end
