class CreateCampSessions < ActiveRecord::Migration
  def change
    create_table :camp_sessions do |t|
      t.integer :number
      t.date :start_date
      t.date :end_date
      t.string :age_range

      t.timestamps
    end
  end
end
