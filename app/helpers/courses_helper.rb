module CoursesHelper
  def active(param)
    if param == 'all' and !params.key? :my
      return 'active'
    elsif param == 'my' and params.key? :my
      return 'active'
    end
  end
end
