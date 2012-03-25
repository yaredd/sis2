class SectionCommentsController < ApplicationController
  load_and_authorize_resource
  
  
  # GET /section_comments
  # GET /section_comments.json
  def index
    @section_comments = SectionComment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @section_comments }
    end
  end

  # GET /section_comments/1
  # GET /section_comments/1.json
  def show
    @section_comment = SectionComment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @section_comment }
    end
  end

  # GET /section_comments/new
  # GET /section_comments/new.json
  def new
    @section_comment = SectionComment.new
    @section_comment.section_id = params[:section_id]
		@section_comment.teacher_id = current_user.role?( :teacher) ? Teacher.find_by_login(current_user.login).id : params[:teacher_id]
		@section_comment.period = Period.current_grading_period
		
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @section_comment }
    end
  end

  # GET /section_comments/1/edit
  def edit
  	@section_comment = SectionComment.find(params[:id])

  end

  # POST /section_comments
  # POST /section_comments.json
  def create
  	@section_comment = SectionComment.new
    @section_comment.section_id = params[:section_comment][:section_id]
		@section_comment.teacher_id = params[:section_comment][:teacher_id]
		@section_comment.period = params[:section_comment][:period]
    @section_comment.comment = params[:section_comment][:comment]

    respond_to do |format|
      if @section_comment.save
        format.html { redirect_to schedules_path, notice: 'Section comment was successfully created.' }
        format.json { render json: @section_comment, status: :created, location: @section_comment }
      else
        format.html { render action: "new" }
        format.json { render json: @section_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /section_comments/1
  # PUT /section_comments/1.json
  def update
    @section_comment = SectionComment.find(params[:id])
		@section_comment.comment = params[:section_comment][:comment]
		
    respond_to do |format|
      if @section_comment.save
        format.html { redirect_to schedules_path, notice: 'Section comment was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @section_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /section_comments/1
  # DELETE /section_comments/1.json
  def destroy
    @section_comment = SectionComment.find(params[:id])
    @section_comment.destroy

    respond_to do |format|
      format.html { redirect_to section_comments_url }
      format.json { head :ok }
    end
  end
end
