class Answer < ActiveRecord::Base
<<<<<<< HEAD
=======
  has_many :comments, dependent: :destroy
  belongs_to :question
>>>>>>> testing
  attr_accessible :anonymous, :answer, :commenter, :votes
  accepts_nested_attributes_for :comments
end
