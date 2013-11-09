class CreateCampSeasons < ActiveRecord::Migration
  def change
    create_table :camp_seasons do |t|
      t.integer :year

      t.timestamps
    end
  end
end
