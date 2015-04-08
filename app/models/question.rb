class Question < ActiveRecord::Base
  belongs_to :asker, class_name: "User"
  has_many :answers
  has_many :question_tags
  has_many :tags, through: :question_tags
  validates_presence_of :content
  accepts_nested_attributes_for :tags, :answers

  def self.search(search)
    # if search
    where('content LIKE ?', "%#{search}%")
    # else
    #   where(:all)
    # end
  end
end
