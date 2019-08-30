class ColorsController < ApplicationController
  COLOR_MAX = 255
  DARK_GREY = '333333'
  LIGHT_GREY = 'EEEEEE'

  def index
    @color = Color.random_color()

    text_mix()

    puts "\n\nCruller Mix: ##{@color}\n\n"

    respond_to do |format|
      format.html
      format.json { render json: @color }
    end
  end

  def show
    @color = Color.new(hex_code: params[:color])

    if @color.validate
      text_mix()

      puts "\n\nCruller: ##{@color}\n\n"
    else
      render 'colors/error'

      puts "\n\nError: #W0MPX3!\n\n"
    end
  end

  def error
  end

  private

  def text_mix()
    @panel_color = @color.average > (COLOR_MAX / 2) ? DARK_GREY : LIGHT_GREY
    @text_color = @color.average > (COLOR_MAX / 2) ? LIGHT_GREY : DARK_GREY
  end
end
