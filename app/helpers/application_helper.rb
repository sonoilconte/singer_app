module ApplicationHelper

  def title(text)
    content_for :title, text
  end

  def nav_link(display_text, path)
    class_name = current_page?(path) ? 'active' : nil
    # Create li tag with class active if the link is to the current page
    content_tag(:li, :class => class_name) do
      link_to display_text, path
    end
  end

end
