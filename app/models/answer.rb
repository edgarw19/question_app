class Answer < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :question
  attr_accessible :anonymous, :answer, :commenter, :votes
  accepts_nested_attributes_for :comments
end
