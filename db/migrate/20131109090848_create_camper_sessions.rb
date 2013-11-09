class CreateCamperSessions < ActiveRecord::Migration
  def change
    create_table :camper_sessions do |t|
      t.belongs_to :camp_session, index: true
      t.belongs_to :camper_registration, index: true

      t.timestamps
    end
  end
end
