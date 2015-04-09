class Tag < ActiveRecord::Base
	# has_many :question_tags
	# has_many :questions, through: :question_tags
  validates :name, uniqueness: true
  # def self.search(search)
  #   Question.joins(:tags).where('name LIKE ?', "%#{search}%")
  # end
  # Question.joins("LEFT JOIN `question_tags` ON question_tags.question_id = questions.id LEFT JOIN `tags` ON tags.id = question_tags.tag_id")

end
