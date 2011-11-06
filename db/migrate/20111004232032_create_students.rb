class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :adminPlusId
      t.string :firstName
      t.string :lastName
      t.string :middleName
      t.string :gender
      t.string :grade

      t.timestamps
    end
  end
end
