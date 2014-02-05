class Comment < ActiveRecord::Base
  attr_accessible :anonymous, :comment, :votes, :writer
  belongs_to :answers
end
