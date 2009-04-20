module ApplicationHelper
  def better_name(name)
    name = name.humanize
    name.gsub!("Yacht", "")
    name.gsub!("specification","")
    name.strip.capitalize
  end
end
