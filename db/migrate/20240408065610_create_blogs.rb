class CreateBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs do |t|

      t.string :blog_title, null: false
      t.text :blog_body, null: false

      t.timestamps
    end
  end
end
