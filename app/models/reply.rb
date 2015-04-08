class Reply < ActiveRecord::Base
	belongs_to :answer
	delegate :question, to: :answer
end