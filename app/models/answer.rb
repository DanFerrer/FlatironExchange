class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :responder, class_name: "User"
  has_many :replies
end
