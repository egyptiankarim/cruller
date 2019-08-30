class ColorName < ApplicationRecord
  has_many :colors, through: :votes
end
