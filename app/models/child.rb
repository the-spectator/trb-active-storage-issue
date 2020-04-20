# frozen_string_literal: true

class Child < ApplicationRecord
  belongs_to :parent

  has_one_attached :id_card_image
end
