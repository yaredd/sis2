class AddGradingPeriodToGrades < ActiveRecord::Migration
  def change
    add_column :grades, :grading_period, :string
  end
end
