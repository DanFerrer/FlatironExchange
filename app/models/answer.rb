class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :responder, class_name: "User"
  
  def add_vote
    update(votes: self.votes += 1)
  end
end
