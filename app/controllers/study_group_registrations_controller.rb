class StudyGroupRegistrationsController < ApplicationController
 
  before_filter :require_login
  before_filter :require_user, :only => [:show, :destroy]  
  
  def require_user
    @registration = StudyGroupRegistration.find(params[:id])
    if @registration.user.id != session[:uid]
      redirect_to root_url, notice: "Please Sign In to Register"
    end
  end
  
  # GET /registrations
  # GET /registrations.json
  def index
    @user = User.find(params[:user_id])
    @registrations = @user.registrations

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @registrations }
    end
  end

  # GET /registrations/1
  # GET /registrations/1.json
  def show
    @user = User.find(params[:user_id])
    # @student = Student.find_by_user_id()
    @registration = @user.registrations.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @registration }
    end
  end

  # GET /registrations/new
  # GET /registrations/new.json
  def new
    @registration = StudyGroupRegistration.new
    @registration.study_group = StudyGroup.find(params[:study_group_id])
    @student = Student.find_by_user_id(session[:uid])
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @registration }
    end
  end

  # GET /registrations/1/edit
  def edit
    @registration = StudyGroupRegistration.find(params[:id])
  end

  # POST /registrations
  # POST /registrations.json
  def create
    @registration = StudyGroupRegistration.new(params[:study_group_registration])
    # @student = Student.find_by_user_id(session[:uid])
    # @registration.student_id = @student.id
    @registration.student = Student.find_by_user_id(session[:uid])

    
    respond_to do |format|
      if @registration.save   
        format.html { redirect_to student_url(@registration.student), notice: 'StudyGroupRegistration was successfully created.' }
        format.json { render json: @registration, status: :created, location: @registration }
      else
        format.html { render action: "new" }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /registrations/1
  # PUT /registrations/1.json
  def update
    @registration = StudyGroupRegistration.find(params[:id])

    respond_to do |format|
      if @registration.update_attributes(params[:registration])
        format.html { redirect_to @registration, notice: 'StudyGroupRegistration was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registrations/1
  # DELETE /registrations/1.json
  def destroy
    @registration = @user.registrations.find(params[:id])
    @registration.destroy
    flash[:notice] = "StudyGroupRegistration Cancelled."
    
    respond_to do |format|
      format.html { redirect_to user_url(@registration.user) }
      format.json { head :no_content }
    end
  end
end