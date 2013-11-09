class CreateCamperCabinAssignments < ActiveRecord::Migration
  def change
    create_table :camper_cabin_assignments do |t|
      t.belongs_to :cabin_assignemnt, index: true

      t.timestamps
    end
  end
end
