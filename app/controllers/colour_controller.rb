class ColourController < ApplicationController
  COLOUR_MAX = 255
  DARK_GREY = '333333'
  LIGHT_GREY = 'EEEEEE'

  def index
    @colour = Colour.random_colour

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
