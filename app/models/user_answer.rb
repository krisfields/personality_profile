class UserAnswer < ActiveRecord::Base
  attr_accessible :answer_id, :user_id

  belongs_to :user
  belongs_to :answer
end
