module ApplicationHelper

  def urls_to_images(s)
    s.gsub! /\s((https|http):\/\/.[\S]+\.(png|jpg|jpeg|svg|gif))\s/,
     '<p><img src="\1" width="400" height="110"></p>'
    s.html_safe
  end

  def urls_to_links(s)
    s.gsub! /\s((https|http):\/\/.[\S]+)\s/, '<a href="\1" target=_blank>\1</a>'
    s.html_safe
  end

end
