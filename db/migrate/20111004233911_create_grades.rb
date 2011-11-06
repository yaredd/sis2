class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.references :schedule
      t.references :mark
      t.references :effort

      t.timestamps
    end
    add_index :grades, :schedule_id
    add_index :grades, :mark_id
    add_index :grades, :effort_id
  end
end
