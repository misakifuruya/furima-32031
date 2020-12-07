class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :title,             null: false
      t.references :user,              null: false, foreign_key: true
      t.text       :explanation,       null: false
      t.string     :category_id,       null: false
      t.integer    :status_id,         null: false
      t.integer    :shipping_cost_id,  null: false
      t.integer    :area_id,           null: false
      t.integer    :days_id,           null: false
      t.integer    :price,             null: false

      t.timestamps
    end
  end
end
