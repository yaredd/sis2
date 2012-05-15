class FinalGradesController < ApplicationController
  # GET /final_grades
  # GET /final_grades.json
  def index
    @final_grades = FinalGrade.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @final_grades }
    end
  end

  # GET /final_grades/1
  # GET /final_grades/1.json
  def show
    @final_grade = FinalGrade.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @final_grade }
    end
  end

  # GET /final_grades/new
  # GET /final_grades/new.json
  def new
    @final_grade = FinalGrade.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @final_grade }
    end
  end

  # GET /final_grades/1/edit
  def edit
    @final_grade = FinalGrade.find(params[:id])
  end

  # POST /final_grades
  # POST /final_grades.json
  def create
    @final_grade = FinalGrade.new(params[:final_grade])

    respond_to do |format|
      if @final_grade.save
        format.html { redirect_to @final_grade, notice: 'Final grade was successfully created.' }
        format.json { render json: @final_grade, status: :created, location: @final_grade }
      else
        format.html { render action: "new" }
        format.json { render json: @final_grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /final_grades/1
  # PUT /final_grades/1.json
  def update
    @final_grade = FinalGrade.find(params[:id])

    respond_to do |format|
      if @final_grade.update_attributes(params[:final_grade])
        format.html { redirect_to @final_grade, notice: 'Final grade was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @final_grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /final_grades/1
  # DELETE /final_grades/1.json
  def destroy
    @final_grade = FinalGrade.find(params[:id])
    @final_grade.destroy

    respond_to do |format|
      format.html { redirect_to final_grades_url }
      format.json { head :ok }
    end
  end
end
