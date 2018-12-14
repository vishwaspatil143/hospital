class AddColumnsToDoctor < ActiveRecord::Migration[5.1]
  def change
    add_column :doctors, :f_name, :string
    add_column :doctors, :l_name, :string
  end
end
