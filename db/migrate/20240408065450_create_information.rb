class CreateInformation < ActiveRecord::Migration[6.1]
  def change
    create_table :information do |t|

      t.string :info_title, null: false
      t.text :info_body, null: false

      t.timestamps
    end
  end
end
