json.extract! doctor, :id, :email, :f_name, :l_name, :created_at, :updated_at
json.url doctor_url(doctor, format: :json)
