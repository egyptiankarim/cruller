module ColourHelper
  def colour_panel(colour, panel_colour, text_colour, link = root_path)
    render('colour/shared/colour_panel', colour: colour, panel_colour: panel_colour, text_colour: text_colour, link: link)
  end

  def meta_panel(colour, panel_colour, text_colour)
    render('colour/shared/meta_panel', colour: colour, panel_colour: panel_colour, text_colour: text_colour)
  end
end
