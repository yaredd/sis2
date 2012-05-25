class AddGradingPeriodToStandards < ActiveRecord::Migration
  def change
    add_column :standards, :grading_period, :string
  end
end
