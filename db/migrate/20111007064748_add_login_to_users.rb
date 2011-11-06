class AddLoginToUsers < ActiveRecord::Migration
  def change
    add_column :users, :login, :string, :unique => true, :null => false
  end
end
