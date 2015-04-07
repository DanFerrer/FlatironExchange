class User < ActiveRecord::Base
  has_many :questions
  has_many :answers, through: :questions, foreign_key: "responder_id"

  def self.create_with_omniauth(auth)
    binding.pry
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.email = auth["info"]["email"]
      user.image_url = auth["info"]["image"]
    end
  end
end
