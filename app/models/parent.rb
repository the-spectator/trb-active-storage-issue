# frozen_string_literal: true

class Parent < ApplicationRecord
  has_one_attached :profile_image

  has_many :children
end
