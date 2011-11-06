class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.references :course
      t.integer :sectionNumber

      t.timestamps
    end
    add_index :sections, :course_id
  end
end
