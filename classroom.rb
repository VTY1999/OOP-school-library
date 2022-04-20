class ClassRoom
  attr_accessor :label, :student

  def initialize(label)
    @label = label
    @student = []
  end

  def add_student(label, student)
    @student.push({ student: student, label: label })
    student.classroom = self
  end
end
