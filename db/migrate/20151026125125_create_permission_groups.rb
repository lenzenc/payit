class CreatePermissionGroups < ActiveRecord::Migration
  def change
    create_table :permission_groups do |t|
      t.string :code, null: false, limit: 20
      t.string :name, null: false, limit: 100
    end
    add_index :permission_groups, :code, unique: true
    add_index :permission_groups, :name, unique: true
  end
end
