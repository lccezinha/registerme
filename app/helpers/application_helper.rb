module ApplicationHelper

  def list_student_memberships(student)
    if student.courses.any?
      render partial: 'courses', locals: { courses: @student.courses }
    else
      content_tag(:p, t('students.courses.empty'))
    end
  end

end
