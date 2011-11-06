class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.references :student
      t.references :section
      t.references :teacher
      t.references :period
      t.references :block
      t.references :school_setup

      t.timestamps
    end
    add_index :schedules, :student_id
    add_index :schedules, :section_id
    add_index :schedules, :teacher_id
    add_index :schedules, :period_id
    add_index :schedules, :block_id
    add_index :schedules, :school_setup_id
  end
end
