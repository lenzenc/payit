class CreateJoinTableCustomFeatureModule < ActiveRecord::Migration
  def change
    create_join_table :customers, :feature_modules do |t|
      t.index [:feature_module_id, :customer_id], unique: true, name: "IDX_UNIQ_CUSTOMER_FEAT_MOD"
    end
  end
end
