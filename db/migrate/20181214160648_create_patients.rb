class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.string :f_name
      t.string :l_name
      t.text :disease

      t.timestamps
    end
  end
end
