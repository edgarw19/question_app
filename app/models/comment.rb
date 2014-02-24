class Comment < ActiveRecord::Base
  belongs_to :answer
  attr_accessible :anonymous, :comment, :writer, :votes
   acts_as_votable
end

