class CreateStandards < ActiveRecord::Migration
  def change
    create_table :standards do |t|
      t.string :name
      t.references :course

      t.timestamps
    end
    add_index :standards, :course_id
  end
end
