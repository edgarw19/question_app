class Answer < ActiveRecord::Base
  attr_accessible :anonymous, :answer, :commenter, :votes
end
