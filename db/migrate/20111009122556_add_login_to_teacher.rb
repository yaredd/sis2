class AddLoginToTeacher < ActiveRecord::Migration
  def change
    add_column :teachers, :login, :string, :unique => true, :null => false
  end
end
