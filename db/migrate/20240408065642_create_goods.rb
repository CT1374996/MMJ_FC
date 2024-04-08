class CreateGoods < ActiveRecord::Migration[6.1]
  def change
    create_table :goods do |t|

      t.string :goods_name
      t.text :goods_info
      t.integer :price

      t.timestamps
    end
  end
end
