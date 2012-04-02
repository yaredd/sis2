class StudentsController < ApplicationController
  load_and_authorize_resource

  # GET /students
  # GET /students.json
  def index
    @students = Student.page(params[:page]).order(:lastName)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @students }
    end
  end
  
  def report_card 
    @students = Student.order(:firstName,:grade).search(params[:grade], params[:student]).includes(:schedules => [:grades]).where("grades.grading_period = ?", params[:grading_period]||=Period.current_grading_period).page(params[:page]).per(10)
  end

  def warning_grades
    @students = Student.order(:grade, :firstName, :teacher_id).search(params[:grade], params[:student_id]||="")
  end

  def interim_report_card 
    @students = Student.search(params[:grade], params[:student]).includes(:schedules => [:interim_grades]).where("interim_grades.grading_period = ?", params[:grading_period]||=Period.current_grading_period).page(params[:page]).per(10)
  end
  
  # GET /students/1
  # GET /students/1.json
 # def show
  #  @student = Student.find(params[:id])
#
 #   respond_to do |format|
  #    format.html # show.html.erb
   #   format.json { render json: @student }
    #end
  #end

  # GET /students/new
  # GET /students/new.json
  def new
    @student = Student.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @student }
    end
  end

  # GET /students/1/edit
  def edit
    @student = Student.find(params[:id])
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(params[:student])

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render json: @student, status: :created, location: @student }
      else
        format.html { render action: "new" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /students/1
  # PUT /students/1.json
  def update
    @student = Student.find(params[:id])

    respond_to do |format|
      if @student.update_attributes(params[:student])
        format.html { redirect_to students_path, notice: 'Student was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { head :ok }
    end
  end
end
