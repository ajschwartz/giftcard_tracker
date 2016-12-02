class CreateUsages < ActiveRecord::Migration
  def change
    create_table :usages do |t|
      t.integer :giftcard_id
      t.date :date
      t.string :purchase
      t.decimal :amount, precision: 8, scale: 2
      t.integer :user_id

      t.timestamps

    end
  end
end
