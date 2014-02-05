class Question < ActiveRecord::Base
  attr_accessible :query, :text
  validates :query, presence: true
end
