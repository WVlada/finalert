class CreateTickers < ActiveRecord::Migration
  def change
    create_table :tickers do |t|
      t.text :name
      t.float :last_price
      t.float :last_price_percent
      t.float :volume

      t.timestamps null: false
    end
  end
end
