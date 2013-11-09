class CreateCabinAssignments < ActiveRecord::Migration
  def change
    create_table :cabin_assignments do |t|
      t.belongs_to :camp_session, index: true
      t.string :name

      t.timestamps
    end
  end
end
