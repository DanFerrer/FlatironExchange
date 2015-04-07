class Question < ActiveRecord::Base
  belongs_to :asker, class_name: "User"
  has_many :answers

  validates_presence_of :content
end
