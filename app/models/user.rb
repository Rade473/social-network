class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :profile_picture

  has_many :posts

  has_many :comments

  has_many :likes

  has_many :invitations

  def profile_picture_thumbnail
    profile_picture
  end

  def friends
   friends_i_sent_invitation = Invitation.where('user_id = ?', id).where('confirmed' => true).pluck(:friend_id)
   friends_who_sent_me_invitation = Invitation.where('friend_id = ?', id).where('confirmed' => true).pluck(:user_id)
   ids = friends_i_sent_invitation + friends_who_sent_me_invitation
   User.where(id: ids)
  end

  def friends_with?(user)
    Invitation.confirmed_record?(id, user.id)
  end

  def send_invitation(user)
    invitations.create(friend_id: user.id)
  end
end
