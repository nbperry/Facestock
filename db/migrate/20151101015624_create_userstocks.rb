class CreateUserstocks < ActiveRecord::Migration
  def change
    create_table :userstocks do |t|
      t.integer :userStockID
      t.integer :userID
      t.string :ticker
      t.integer :quantity
      t.string :stockMessages

      t.timestamps
    end
  end
end