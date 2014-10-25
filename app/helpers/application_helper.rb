module ApplicationHelper
  def link_to_add_skills(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    skills = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_skills", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, skills: skills.gsub("\n", "")})
  end

  def bootstrap_class_for flash_type
      { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type] || flash_type.to_s
    end

    def flash_messages(opts = {})
      flash.each do |msg_type, message|
        concat(content_tag(:div, message, class: "alert alert-#{bootstrap_class_for(msg_type)} fade in") do
                concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
                concat message
              end)
      end
      nil
    end
end
