class CreateMedications < ActiveRecord::Migration
  def change
    create_table :medications do |t|
      t.string :name
      t.string :frequency
      t.string :dosage
      t.belongs_to :camper_registration, index: true

      t.timestamps
    end
  end
end
