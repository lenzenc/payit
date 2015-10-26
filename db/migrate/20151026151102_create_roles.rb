class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name, null: false, limit: 100
    end
    add_index :roles, :name, unique: true, name: "IDX_UNQ_ROLE_NAME"
    create_join_table :roles, :permissions do |t|
      t.index [:role_id, :permission_id], unique: true, name: "IDX_UNIQ_ROLE_PERM"
    end
  end
end
