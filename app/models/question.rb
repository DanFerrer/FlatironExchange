class Question < ActiveRecord::Base
  belongs_to :asker, class_name: "User"
  has_many :answers, dependent: :destroy
  # has_many :question_tags
  # has_many :tags, through: :question_tags
  validates_presence_of :content, :title
  # accepts_nested_attributes_for :tags, :answers
  acts_as_taggable # Alias for acts_as_taggable_on :tags
  # acts_as_taggable_on :skills, :interests

  def self.search(search)
    Question.where('title LIKE ? OR content LIKE ?', "%#{search}%", "%#{search}%")
  end

  def tags_name
    Tag.find_or_create_by_name(:name)
  end
end
