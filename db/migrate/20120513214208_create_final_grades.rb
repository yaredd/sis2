class CreateFinalGrades < ActiveRecord::Migration
  def change
    create_table :final_grades do |t|
      t.references :schedule
      t.references :effort
      t.integer :sem2
      t.integer :exam
      t.integer :sem2final

      t.timestamps
    end
    add_index :final_grades, :schedule_id
    add_index :final_grades, :effort_id
  end
end
