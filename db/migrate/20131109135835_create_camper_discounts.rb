class CreateCamperDiscounts < ActiveRecord::Migration
  def change
    create_table :camper_discounts do |t|
      t.belongs_to :camper_registration, index: true
      t.belongs_to :discount, index: true

      t.timestamps
    end
  end
end
