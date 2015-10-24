class AddUserDetails < ActiveRecord::Migration
  def change

    add_column :users, :first_name, :string, :null => false, :limit => 100
    add_column :users, :last_name, :string, :null => false, :limit => 100
    add_column :users, :employee_id, :string, :null => true, :limit => 100
    add_column :users, :is_active, :boolean, :null => false, :default => true
    add_column :users, :customer_id, :integer, :null => false

  end
end
