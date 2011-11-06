class ChangeAttendanceAbsentToFloat < ActiveRecord::Migration
  def change
    change_column :students, :attendance_absent, :float
  end
end
