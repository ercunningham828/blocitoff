class Item < ActiveRecord::Base
  belongs_to :user

  default_scope { order('updated_at ASC') }

  validates :user, presence: true
  validates :name, length: {minimum: 5}, presence: true
end
