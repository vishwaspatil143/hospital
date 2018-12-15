class Patient < ApplicationRecord
  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients
  accepts_nested_attributes_for :doctors
  validates :email, presence: true
end
