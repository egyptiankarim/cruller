module ColorsHelper
  def color_card(color, card_color, text_color, link = root_path)
    render('colors/shared/color_card', color: color, card_color: card_color, text_color: text_color, link: link)
  end

  def meta_card(color, card_color, text_color)
    render('colors/shared/meta_card', color: color, card_color: card_color, text_color: text_color)
  end
end