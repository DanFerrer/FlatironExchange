class Answer < ActiveRecord::Base
  belongs_to :question
  delegate :responder, to: :question
end
