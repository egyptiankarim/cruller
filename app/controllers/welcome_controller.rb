class WelcomeController < ApplicationController
  def index
    @red = rand(255)
    @green = rand(255)
    @blue = rand(255)

    color_average = (@red + @green + @blue) / 3

    @panel_color = color_average > (255 / 2) ? "333" : "eee"

    @hex_color = ("%s%s%s" % [@red, @green, @blue].map { |e| to_hex(e) })
  end

  private

  def to_hex(number = 0, padding = 2)
    number.to_s(16).rjust(padding, '0').upcase
  end
end
