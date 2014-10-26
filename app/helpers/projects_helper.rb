module ProjectsHelper
  def post_css(project)
    'favorite' if project.applied?
  end
end
