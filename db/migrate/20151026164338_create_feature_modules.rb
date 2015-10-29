class CreateFeatureModules < ActiveRecord::Migration
  def change
    create_table :feature_modules do |t|
      t.string :code, null: false, limit: 20
      t.boolean :is_visible, null: false, default: true
      t.boolean :is_default, null: false, default: false
      t.timestamps
    end
    create_join_table :feature_modules, :roles do |t|
      t.index [:feature_module_id, :role_id], unique: true, name: "IDX_UNIQ_FEAT_MOD_ROLE"
    end
    create_join_table :feature_modules, :permission_groups do |t|
      t.index [:feature_module_id, :permission_group_id], unique: true, name: "IDX_UNIQ_MOD_PERM_GRP"
    end
    add_index :feature_modules, :code, unique: true, name: "IDX_UNIQ_FEAT_MOD_NAME"
  end
end
