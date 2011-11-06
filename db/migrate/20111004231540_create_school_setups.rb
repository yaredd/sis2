class CreateSchoolSetups < ActiveRecord::Migration
  def change
    create_table :school_setups do |t|
      t.string :name
      t.string :schoolYear
      t.string :principal

      t.timestamps
    end
  end
end
