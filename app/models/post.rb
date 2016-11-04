class Post < ApplicationRecord
  belongs_to :user

  validates :chirp, length: { maximum: 170 }
  validates_presence_of :chirp
  
  attachment :file, type: :image

  def self.timeline(user)
   following_ids = user.followees(User).pluck(:id)
   all_ids = following_ids << user.id
   Post.where(user_id: all_ids).order("created_at DESC")
  end
end
