class AddColumnsToStudents < ActiveRecord::Migration
  def change
    add_column :students, :attendance_tardy, :integer
    add_column :students, :attendance_absent, :integer
  end
end
