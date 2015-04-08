class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :responder, class_name: "User"
  validates_presence_of :content
  # acts_as_voteable
end
