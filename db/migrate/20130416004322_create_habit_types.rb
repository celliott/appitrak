class CreateHabitTypes < ActiveRecord::Migration
  def change
    create_table :habit_types do |t|

      t.timestamps
    end
  end
end
