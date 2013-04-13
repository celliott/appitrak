class CreateHabitsUsersJoin < ActiveRecord::Migration
  def change
    create_table :habits_users do |t|
      t.integer "habit_id"
      t.integer "user_id"
      t.timestamps
    end
  add_index :habits_users, ["habits_id", "user_id"]
  end
  
  def down
    drop_table :habits_users
  end
end