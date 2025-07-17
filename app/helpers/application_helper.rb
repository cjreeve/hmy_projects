module ApplicationHelper
  def markdown(text)
    renderer = Redcarpet::Render::HTML.new(filter_html: true, hard_wrap: true)
    markdown = Redcarpet::Markdown.new(renderer, fenced_code_blocks: true, autolink: true, tables: true)
    markdown.render(text.to_s).html_safe
  end
end
