class Person
    attr_accessor :name, :age, :id

    def initialize(age, name = "Unknown", parent_permission = true)
      @id = Random.rand(1..1000)
      @name = name
      @age = age
      @parent_permission = parent_permission
    end
  end

  def can_use_services?
    true if age >= 18 && @parent_permission
  end

  private

  def is_of_age?
    true if age >= 18
    false
  end
end

barry = Person.new(15)
print barry.can_use_services?