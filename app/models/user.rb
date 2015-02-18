class User < ActiveRecord::Base
has_many :posts
mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable


def admin?
  role == 'admin'
end

def moderator?
  role == 'moderator'
end
end
