class Post < ActiveRecord::Base
  has_many :comments
  # @post.save will return false if the title is nonexistant or < 5 chars  
  validates :title, presence: true,
    length: { minimum: 5 }
  validates :text, presence: true,
    length: { minimum: 1 }
end

