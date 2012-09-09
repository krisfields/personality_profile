class Quiz < ActiveRecord::Base
  attr_accessible :approved, :description, :name, :user_id
end
