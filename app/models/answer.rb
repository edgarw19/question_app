class Answer < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :question
  attr_accessible :anonymous, :answer, :commenter, :votes
end
