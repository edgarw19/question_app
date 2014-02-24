class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  attr_accessible :query, :text, :answers_attributes
  validates :query, presence: true
  accepts_nested_attributes_for :answers
  acts_as_votable
end
