class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :votes
      t.string :writer
      t.text :comment
      t.boolean :anonymous

      t.timestamps
    end
  end
end
