class CreateUserstocks < ActiveRecord::Migration
  def change
    create_table :userstocks do |t|
      t.integer :userStockID
      t.references :user, index: true, foreign_key: true
      t.string :ticker
      t.integer :quantity
      t.string :stockMessages

      t.timestamps
    end
  end
end