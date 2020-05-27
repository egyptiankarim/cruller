module ColorsHelper
  def color_panel(color, panel_color, text_color, link = root_path)
    render('colors/shared/color_panel', color: color, panel_color: panel_color, text_color: text_color, link: link)
  end

  def meta_panel(color, panel_color, text_color)
    render('colors/shared/meta_panel', color: color, panel_color: panel_color, text_color: text_color)
  end
end