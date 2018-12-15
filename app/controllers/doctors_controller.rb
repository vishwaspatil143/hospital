class DoctorsController < ApplicationController
  before_action :authenticate_doctor!
  before_action :set_doctor, only: [:show, :edit, :update, :create_patient]

  # GET /doctors/1
  # GET /doctors/1.json
  def show
    @patients = @doctor.patients
  end

  # GET /doctors/1/edit
  def edit
  end

  # PATCH/PUT /doctors/1
  # PATCH/PUT /doctors/1.json
  def update
    respond_to do |format|
      if @doctor.update(doctor_params)
        format.html { redirect_to @doctor, notice: 'Doctor was successfully updated.' }
        format.json { render :show, status: :ok, location: @doctor }
      else
        format.html { render :edit }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_patient
    if request.get?
    else
      respond_to do |format|
        if @doctor.save(doctor_params)
          format.html { redirect_to create_patient_doctor_path(@doctor), notice: 'patient is successfully created.' }
          format.json { render :create_patient, status: :ok, location: @doctor }
        else
          format.html { render :create_patient }
          format.json { render json: @doctor.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def patient_info
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctor
      @doctor = Doctor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doctor_params
      params.require(:doctor).permit(:email, :f_name, :l_name, :avatar, :patients_attributes => [:id, :email, :f_name, :l_name, :disease])
    end
end
