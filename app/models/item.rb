class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :list

  default_scope { order('created_at ASC') }
  scope :viewable, -> {where(user_id: current_user)}

  validates :user, presence: true
  validates :name, length: {minimum: 5}, presence: true

    def days_left
      7-(DateTime.now.to_date - created_at.to_date).to_i
   end
end
