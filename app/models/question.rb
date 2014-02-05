class Question < ActiveRecord::Base
  has_many :answers
  attr_accessible :query, :text
  validates :query, presence: true
end
