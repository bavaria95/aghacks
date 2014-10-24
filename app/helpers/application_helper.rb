module ApplicationHelper
  def link_to_add_skills(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    skills = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_skills", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, skills: skills.gsub("\n", "")})
  end
end
