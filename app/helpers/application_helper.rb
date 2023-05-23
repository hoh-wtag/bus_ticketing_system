module ApplicationHelper
  def sortable_column_header(column_title, column_name)
    link_to(column_title, { sort_column: column_name, sort_direction: toggle_direction(column_name) })
  end

  def toggle_direction(column_name)
    params[:sort_column] == column_name && params[:sort_direction] == 'asc' ? 'desc' : 'asc'
  end
end
