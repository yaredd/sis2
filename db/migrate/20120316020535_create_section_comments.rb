class CreateSectionComments < ActiveRecord::Migration
  def change
    create_table :section_comments do |t|
      t.references :section
      t.references :teacher
      t.string :period
      t.text :comment

      t.timestamps
    end
    add_index :section_comments, :section_id
    add_index :section_comments, :teacher_id
  end
end
