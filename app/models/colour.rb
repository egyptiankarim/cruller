class Colour < ActiveRecord::Base
  validates :hex_code,
    presence: true,
    format: { with: /[a-fA-F0-9]{6}/, message: "Invalid hex colour code." }

  def self.random_colour(red_max = 255, green_max = 255, blue_max = 255)
    red = rand(red_max)
    green = rand(green_max)
    blue = rand(blue_max)

    hex_code = "%s%s%s" % [red, green, blue].map { |c| to_hex(c) }

    return Colour.new(hex_code: hex_code)
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
