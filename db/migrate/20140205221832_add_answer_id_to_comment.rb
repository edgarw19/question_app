class AddAnswerIdToComment < ActiveRecord::Migration
  def change
    add_column :comments, :answer_id, :integer
    add_index :comments, :answer_id
  end
end
