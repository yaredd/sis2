class SchedulesController < ApplicationController
  load_and_authorize_resource

  # GET /schedules
  # GET /schedules.json
  def index
    if current_user.role? :super_admin or current_user.role? :admin or current_user.role? :admin_ro
      params[:teacher] = Teacher.order(:firstName).first.id unless ! params[:teacher].nil?
      params[:block] = 1 unless ! params[:block].nil?

      @schedules = Schedule.schedule_by_grading_period(params[:grading_period]||=Period.current_grading_period).where(:teacher_id => params[:teacher].to_i).where(:block_id => params[:block]).joins(:student).merge(Student.order(:firstName))
    elsif current_user.role? :teacher
      
      @teacher = Teacher.find_by_login(current_user.login)
      
      @schedules = Schedule.schedule_by_grading_period(params[:grading_period]||=Period.current_grading_period).where("schedules.teacher_id = ?",  @teacher.id).where(:block_id => params[:block]||=Block.by_teacher(@teacher.id).first.id).joins(:student).merge(Student.order(:firstName))
    end


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @schedules }
    end
  end

  def verification
      params[:teacher] = Teacher.order(:firstName).first.id unless ! params[:teacher].nil?
      @schedules = Schedule.schedule_by_grading_period(params[:grading_period]||=Period.current_grading_period).where(:teacher_id => params[:teacher].to_i).joins(:student).merge(Student.order(:firstName))
  end

  # GET /schedules/1
  # GET /schedules/1.json
  def show
    @schedule = Schedule.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @schedule }
    end
  end

  # GET /schedules/new
  # GET /schedules/new.json
  def new
    @schedule = Schedule.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @schedule }
    end
  end

  # GET /schedules/1/edit
  def edit
    @schedule = Schedule.find(params[:id])
  end

  # POST /schedules
  # POST /schedules.json
  def create
    @schedule = Schedule.new(params[:schedule])

    respond_to do |format|
      if @schedule.save
        format.html { redirect_to @schedule, notice: 'Schedule was successfully created.' }
        format.json { render json: @schedule, status: :created, location: @schedule }
      else
        format.html { render action: "new" }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /schedules/1
  # PUT /schedules/1.json
  def update
    @schedule = Schedule.find(params[:id])

    respond_to do |format|
      if @schedule.update_attributes(params[:schedule])
        format.html { redirect_to @schedule, notice: 'Schedule was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy

    respond_to do |format|
      format.html { redirect_to schedules_url }
      format.json { head :ok }
    end
  end
end
