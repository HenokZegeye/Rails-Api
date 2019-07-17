class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :title, :null => false
      t.string :body, :null => false
      t.string :image
      t.text :description

      t.timestamps
    end
  end
end
