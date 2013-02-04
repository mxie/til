module ApplicationHelper
  def tab_class(controller)
    if current_page?(controller: controller)
      'active'
    else
      ''
    end
  end

  def nav_tab(options = {})
    page_controller = options[:controller]
    text = options[:text]
    path = options[:path] || url_for(controller: page_controller)

    content_tag(:li, link_to(text, path), class: tab_class(page_controller))
  end
end
