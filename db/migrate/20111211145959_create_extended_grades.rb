class CreateExtendedGrades < ActiveRecord::Migration
  def change
    create_table :extended_grades do |t|
      t.references :grade
      t.references :benchMark
      t.string :bmGrade

      t.timestamps
    end
    add_index :extended_grades, :grade_id
    add_index :extended_grades, :benchMark_id
  end
end
