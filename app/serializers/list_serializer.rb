class ListSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id
end
