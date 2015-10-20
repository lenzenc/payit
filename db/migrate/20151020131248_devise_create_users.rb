class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      ## Database authenticatable
      t.string :username, null: false, :limit => 100
      t.string :encrypted_password, null: false, :limit => 255

      ## Recoverable
      t.string   :reset_password_token, :limit => 255
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip


      # Lockable
      t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      t.datetime :locked_at


      t.timestamps
    end

    add_index :users, :username, unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
