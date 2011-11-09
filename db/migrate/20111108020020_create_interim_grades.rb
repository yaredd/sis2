class CreateInterimGrades < ActiveRecord::Migration
  def change
    create_table :interim_grades do |t|
      t.references :schedule
      t.references :mark
      t.references :effort
      t.string :grading_period
      t.string :on_task
      t.string :additional_learning
      t.string :positive_attitude
      t.string :comes_prepared
      t.string :attends_class
      t.text :comment

      t.timestamps
    end
    add_index :interim_grades, :schedule_id
    add_index :interim_grades, :mark_id
    add_index :interim_grades, :effort_id
  end
end
