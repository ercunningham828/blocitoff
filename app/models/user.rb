class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  mount_uploader :avatar, AvatarUploader

  has_many :items, dependent: :destroy     
  has_many :lists, dependent: :destroy  

def admin?
   role == 'admin'
 end
   
end
