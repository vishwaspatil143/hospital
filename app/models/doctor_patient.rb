class DoctorPatient < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  after_create :doctor_added

  def doctor_added
    DoctorActivityMailer.with(patient: self.patient_id).patient_added_activity_email.deliver_now
  end
end
