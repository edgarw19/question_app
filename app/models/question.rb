class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  attr_accessible :query, :text
  validates :query, presence: true
  accepts_nested_attributes_for :answers
end
