class Color < ApplicationRecord
  has_many :color_names, through: :votes

  validates :hex_code,
    presence: true,
    length: { minimum: 6, maximum: 6 },
    format: { with: /[a-fA-F0-9]{6}/, message: "Invalid hex color code." }

  def self.random_color(limits = {})

    red_min = limits[:red_min] || 0
    red_max = limits[:red_max] || 255
    green_min = limits[:green_min] || 0
    green_max = limits[:green_max] || 255
    blue_min = limits[:blue_min] || 0
    blue_max = limits[:blue_max] || 255

    red = rand(red_min..red_max).to_i
    green = rand(green_min..green_max).to_i
    blue = rand(blue_min..blue_max).to_i

    hex_code = "%s%s%s" % [red, green, blue].map { |c| to_hex(c) }

    return Color.new(hex_code: hex_code)
  end

  def to_s
    return hex_code.upcase
  end

  def red
    return to_rgb_array[0]
  end

  def green
    return to_rgb_array[1]
  end

  def blue
    return to_rgb_array[2]
  end

  def average
    rgb_array = to_rgb_array

    return (rgb_array.sum / rgb_array.count)
  end

  def to_rgb_array
    rgb_breakdown = hex_code.upcase.scan(/[A-F0-9]{2}/).map{ |c| c.to_i(16) }

    return [rgb_breakdown[0], rgb_breakdown[1], rgb_breakdown[2]]
  end

  private

  def self.to_hex(number = 0, padding = 2)
    number.to_s(16).rjust(padding, '0').upcase
  end
end
