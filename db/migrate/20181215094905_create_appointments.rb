class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.date :start_date
      t.time :start_time
      t.time :end_time
      t.references :doctor, foreign_key: true
      t.references :patient, foreign_key: true

      t.timestamps
    end
  end
end
