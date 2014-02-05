class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :votes
      t.string :commenter
      t.text :answer
      t.boolean :anonymous

      t.timestamps
    end
  end
end
