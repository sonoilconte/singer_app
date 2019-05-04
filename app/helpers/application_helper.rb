module ApplicationHelper

  def nav_link(display_text, path)
    class_name = current_page?(path) ? 'active' : nil
    # Create li tag with class active if the link is to the current page
    content_tag(:li, :class => class_name) do
      link_to display_text, path
    end
  end

  def tester(arg)
    p "Here is the arg #{arg}"
  end

end
