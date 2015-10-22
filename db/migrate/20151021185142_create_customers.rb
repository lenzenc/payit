class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name, null: false, limit: 100
      t.string :domain, null: false, limit: 100
      t.boolean :is_active, null: false, default: true
      t.timestamps null: false
    end
    add_index :customers, :name, unique: true, name: "IDX_UNQ_NAME"
    add_index :customers, :domain, unique: true, name: "IDX_UNQ_DOMAIN"
  end
end
