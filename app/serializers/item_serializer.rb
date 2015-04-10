class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :list_id, :user_id
end
