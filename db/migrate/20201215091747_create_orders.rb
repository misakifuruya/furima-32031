class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :price  ,null: false
      t.integer :user_id
      t.integer :item_id
      t.timestamps
    end
  end
end
