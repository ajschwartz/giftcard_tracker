class CreateGiftings < ActiveRecord::Migration
  def change
    create_table :giftings do |t|
      t.integer :giver_id
      t.integer :giftcard_id

      t.timestamps

    end
  end
end
