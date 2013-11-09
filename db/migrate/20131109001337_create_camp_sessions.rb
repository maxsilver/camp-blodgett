class CreateCampSessions < ActiveRecord::Migration
  def change
    create_table :camp_sessions do |t|
      t.integer :number
      t.date :start_date
      t.date :end_date
      t.string :age_range
      t.belongs_to :camp_season, index: true

      t.timestamps
    end
  end
end
