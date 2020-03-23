module ApplicationHelper
  def criticidad(criticidad)
    if criticidad.id == 1
      "table-danger"
    else
      if criticidad.id == 2
        "table-warning"
      else
        "table-light"
      end
    end
  end
end
