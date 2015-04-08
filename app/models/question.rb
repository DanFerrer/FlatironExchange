class Question < ActiveRecord::Base
  belongs_to :asker, class_name: "User"
  has_many :answers
  accepts_nested_attributes_for :answers
  validates_presence_of :content
end
