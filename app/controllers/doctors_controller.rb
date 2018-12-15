class DoctorsController < ApplicationController
  before_action :authenticate_doctor!
  before_action :set_doctor, only: [:show, :edit, :update, :create_patient, :patient_info, :create_appointment, :book_appintment]

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
        if @doctor.update(doctor_params)
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
    @patient = Patient.find(params[:patient_id])
    @appointments =  @patient.appointments
  end

  def book_appintment
    @patient = Patient.find(params[:patient_id])
    @appointment = Appointment.new
  end

  def create_appointment
    @patient = Patient.find(params[:patient_id])
    # @appointment = @doctor.appointments.new
    @appointment = @patient.appointments.new
    @appointment.doctor_id = @doctor.id
    @appointment.start_date = params[:appointment][:start_date].to_date
    @appointment.start_date = params[:appointment][:start_time].to_time
    @appointment.start_date = params[:appointment][:end_time].to_time
    respond_to do |format|
      if @appointment.save(appointment_params)
        format.html { redirect_to patient_info_doctor_path(id: @doctor.id, patient_id: @appointment.patient.id ), notice: 'appointment is successfully created.' }
        format.json { render :book_appintment, status: :ok, location: @appointment }
      else
        format.html { render :book_appintment }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
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

    def appointment_params
      params.require(:appointment).permit(:start_date, :start_time, :end_time, :doctor_id,:patient_id)
    end
end
