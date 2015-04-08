class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :responder, class_name: "User"
  acts_as_voteable
end
