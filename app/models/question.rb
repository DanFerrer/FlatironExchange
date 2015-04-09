class Question < ActiveRecord::Base
  belongs_to :asker, class_name: "User"
  has_many :answers
  accepts_nested_attributes_for :answers
  validates :content, :title,  presence: true
  
  def self.search(search)
    # if search
    where('content LIKE ?', "%#{search}%")
    # else
    #   where(:all)
    # end
  end
end
