class WelcomeController < ApplicationController
  COLOUR_MAX = 255
  DARK_GREY = '333333'
  LIGHT_GREY = 'EEEEEE'

  def index
    @colour = Colour.random_colour

    @panel_colour = @colour.average > (COLOUR_MAX / 2) ? DARK_GREY : LIGHT_GREY
    @text_colour = @colour.average > (COLOUR_MAX / 2) ? LIGHT_GREY : DARK_GREY
  end

  def redish
    red = rand(COLOUR_MAX)
    green = blue = rand(red / 2).to_i

    limits = {
      red_min: green,
      red_max: red,
      green_max: green,
      blue_max: blue
    }

    @colour = Colour.random_colour(limits)

    @panel_colour = @colour.average > (COLOUR_MAX / 2) ? DARK_GREY : LIGHT_GREY
    @text_colour = @colour.average > (COLOUR_MAX / 2) ? LIGHT_GREY : DARK_GREY
  end

  def greenish
    green = rand(COLOUR_MAX)
    red = blue = rand(green / 2).to_i

    limits = {
      green_min: red,
      green_max: green,
      red_max: red,
      blue_max: blue
    }

    @colour = Colour.random_colour(limits)

    @panel_colour = @colour.average > (COLOUR_MAX / 2) ? DARK_GREY : LIGHT_GREY
    @text_colour = @colour.average > (COLOUR_MAX / 2) ? LIGHT_GREY : DARK_GREY
  end

  def blueish
    blue = rand(COLOUR_MAX)
    red = green = rand(blue / 2).to_i

    limits = {
      blue_min: red,
      blue_max: blue,
      green_max: green,
      red_max: red
    }

    @colour = Colour.random_colour(limits)

    @panel_colour = @colour.average > (COLOUR_MAX / 2) ? DARK_GREY : LIGHT_GREY
    @text_colour = @colour.average > (COLOUR_MAX / 2) ? LIGHT_GREY : DARK_GREY
  end

  def show
    @colour = Colour.new(hex_code: params[:colour])

    if @colour.validate
      @panel_colour = @colour.average > (COLOUR_MAX / 2) ? DARK_GREY : LIGHT_GREY
      @text_colour = @colour.average > (COLOUR_MAX / 2) ? LIGHT_GREY : DARK_GREY
    else
      render 'errors/error_404'
    end
  end
end
