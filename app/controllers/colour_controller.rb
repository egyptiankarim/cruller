class ColourController < ApplicationController
  COLOUR_MAX = 255
  DARK_GREY = '333333'
  LIGHT_GREY = 'EEEEEE'

  def index
    @colour = Colour.random_colour

    text_mix()

    puts "\n\nCrueller Mix: ##{@colour}\n\n"
  end

  def show
    @colour = Colour.new(hex_code: params[:colour])

    if @colour.validate
      text_mix()

      puts "\n\nCrueller: ##{@colour}\n\n"
    else
      render 'errors/error_404'

      puts "\n\nCruerror: #W0MP!\n\n"
    end
  end

  private

  def text_mix()
    @panel_colour = @colour.average > (COLOUR_MAX / 2) ? DARK_GREY : LIGHT_GREY
    @text_colour = @colour.average > (COLOUR_MAX / 2) ? LIGHT_GREY : DARK_GREY
  end
end
