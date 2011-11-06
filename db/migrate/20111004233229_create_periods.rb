class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.string :name
      t.string :description
      t.date :startDate
      t.date :endDate
      t.references :school_setup

      t.timestamps
    end
    add_index :periods, :school_setup_id
  end
end
