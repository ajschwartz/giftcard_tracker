class CreateGiftcards < ActiveRecord::Migration
  def change
    create_table :giftcards do |t|
      t.integer :user_id
      t.decimal :amount, precision: 8, scale: 2
      t.date :date
      t.integer :retailer_id
      t.string :code
      t.date :expiration
      t.string :cardcvv
      t.text :notes
      t.integer :theme_id

      t.timestamps

    end
  end
end
