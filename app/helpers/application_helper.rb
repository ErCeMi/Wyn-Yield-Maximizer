module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == self.sort_column ? "current #{sort_direction}" : nil
    direction = column == self.sort_column && self.sort_direction == "asc" ? "desc" : "asc"
    link_to title, request.query_parameters.merge({ sort: column_name, direction: direction, page: nil }), {:class => css_class}
  end
end
