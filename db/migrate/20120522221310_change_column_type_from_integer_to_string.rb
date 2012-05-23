class ChangeColumnTypeFromIntegerToString < ActiveRecord::Migration
  def change
		change_column :final_grades, :sem2, :string
		change_column :final_grades, :sem2final, :string
		change_column :final_grades, :exam, :string
  end
end
