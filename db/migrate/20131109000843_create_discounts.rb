class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
      t.text :description
      t.money :amount

      t.timestamps
    end
  end
end
