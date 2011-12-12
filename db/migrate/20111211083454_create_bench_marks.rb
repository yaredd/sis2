class CreateBenchMarks < ActiveRecord::Migration
  def change
    create_table :bench_marks do |t|
      t.string :name
      t.references :standard

    end
    add_index :bench_marks, :standard_id
  end
end
