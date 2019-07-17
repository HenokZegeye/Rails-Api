class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :name, :null => false
      t.text :comment, :null => false
      t.references :blog, foreign_key: true

      t.timestamps
    end
  end
end
