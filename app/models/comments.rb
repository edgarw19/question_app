class Comments < ActiveRecord::Base
  attr_accessible :anonymous, :comment, :votes, :writer
end
