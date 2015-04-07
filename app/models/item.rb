class Item < ActiveRecord::Base
  belongs_to :user

  default_scope { order('created_at ASC') }

  validates :user, presence: true
  validates :name, length: {minimum: 5}, presence: true

    def days_left
      7-(DateTime.now.to_date - created_at.to_date).to_i
   end
end
