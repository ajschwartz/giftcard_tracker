class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.string :category

      t.timestamps

    end
  end
end
