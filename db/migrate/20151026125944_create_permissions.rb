class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.string :code, null: false, limit: 20
      t.string :name, null: false, limit: 100
      t.references :permission_group, null: false
    end
    add_index :permissions, :code, unique: true, name: "IDX_UNQ_PERM_CODE"
    add_index :permissions, :name, unique: true, name: "IDX_UNQ_PERM_NAME"
  end
end
