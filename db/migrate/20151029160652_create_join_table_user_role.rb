class CreateJoinTableUserRole < ActiveRecord::Migration
  def change
    create_join_table :users, :roles do |t|
      t.index [:role_id, :user_id], unique: true, name: "IDX_UNIQ_USER_ROLE"
    end
  end
end
