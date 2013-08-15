class Post < ActiveRecord::Base
  # dependent: :destroy is used to also delete the comments associated with a post if it is deleted  
  has_many :comments, dependent: :destroy
  # @post.save will return false if the title is nonexistant or < 5 chars  
  validates :title, presence: true,
    length: { minimum: 5 }
  validates :text, presence: true,
    length: { minimum: 1 }
end

