class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.string :code, null: false, limit: 20
      t.string :name, null: false, limit: 100
      t.references :permission_group, null: false
    end
    add_index :permissions, :code, unique: true
    add_index :permissions, :name, unique: true
  end
end
