class Question < ActiveRecord::Base
  attr_accessible :quiz_id, :text

  belongs_to :quiz
  has_many :answers
end
