class RemoveSchoolSetupFromSchedules < ActiveRecord::Migration
  def up
    remove_column :schedules, :school_setup_id
  end

  def down
    add_column :schedules, :school_setup_id, :references
  end
end
