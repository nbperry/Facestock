class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :ticker
      t.string :name
      t.decimal :current_price
      t.decimal :change
      t.datetime :updated

      t.timestamps null: false
    end
  end
end
