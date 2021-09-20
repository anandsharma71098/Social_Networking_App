class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar 
  
  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize: "150x150!").processed
    else
      "default_profile.jpg"
    end
  end

  #has_many :friend_requests_as_requestor, foreign_key: :requestor_id, class_name: :FriendRequest
  #has_many :friend_requests_as_receiver, foreign_key: :receiver_id, class_name: :FriendRequest
  #has_many :friend_requests
  has_many :friends
  has_many :companions

end
