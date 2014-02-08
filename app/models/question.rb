class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  attr_accessible :query, :text
  validates :query, presence: true
end
