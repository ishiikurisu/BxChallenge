class CreateTrades < ActiveRecord::Migration[6.1]
  def change
    create_table :trades do |t|
      t.string :party1
      t.string :party2

      t.timestamps
    end
  end
end
