module ApplicationHelper

  def flash_class(type)
    case type
    when "error"
      return "danger"
    else
      return type
    end
  end
end
