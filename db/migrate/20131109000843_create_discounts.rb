class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
      t.text :description
      t.money :amount
      t.belongs_to :camp_season, index: true

      t.timestamps
    end
  end
end
