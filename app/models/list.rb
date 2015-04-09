class List < ActiveRecord::Base
  has_many :items, dependent: :destroy   
  belongs_to :user

  scope :viewable, -> {where(user_id: current_user)}
  
  validates :user, presence: true
  validates :name, length: {minimum: 5}, presence: true
end
