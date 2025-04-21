class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  has_many :post_comments, dependent: :destroy
  #has_many :favorites, dependent: :destroy

  validates :landscape_name, presence: true
  validates :caption, presence: true

  def favorited_by?(user)
   favorites.where(user_id: user.id).exists?
  end
end