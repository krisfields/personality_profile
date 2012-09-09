class Quiz < ActiveRecord::Base
  attr_accessible :approved, :description, :name, :user_id

  belongs_to :user
  has_many :questions
end
