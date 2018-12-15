class DoctorActivityMailer < ApplicationMailer
  default from: 'from@example.com'

  def patient_added_activity_email
    @patient = Patient.find(params[:patient])
    mail(to: @patient.email, subject: 'Welcome to My Hosptial Site')
  end
end
