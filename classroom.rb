class ClassRoom
  attr_accessor :label, :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(label, student)
    @students.push({ student: student, label: label })
    students.classroom = self
  end
end
