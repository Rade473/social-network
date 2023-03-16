
class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :profile_picture

  has_many :posts

  has_many :comments

  has_many :likes

  def profile_picture_thumbnail
    profile_picture
  end
end
