# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :name, :email, :photo, :birthdate
end
