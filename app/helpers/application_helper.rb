module ApplicationHelper
  def header(title)
    content_for(:header) { render(partial: 'layouts/application/header', locals: { title: title }) }
  end
end
