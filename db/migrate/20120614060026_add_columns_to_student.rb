class AddColumnsToStudent < ActiveRecord::Migration
  def change
    add_column :students, :attendance_tardy_sem2, :integer
    add_column :students, :attendance_absent_sem2, :float
  end
end
