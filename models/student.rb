require('pg')
require_relative('../db/sql_runner')
require_relative('../db/sql_runner')



class Student
attr_reader :id, :first_name, :last_name, :house_name, :age

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options["last_name"]
    @house_name = options["house_name"]
    @age = options["age"].to_i
  end

  def save()
    sql = "INSERT INTO students (first_name, last_name, house_name, age) values ($1, $2, $3, $4) RETURNING id"
    values = [@first_name, @last_name, @house_name, @age]
    student = SqlRunner.run(sql, values).first()
    @id = student["id"].to_i
  end

  def self.all()
    sql = "SELECT * FROM students"
    student_info = SqlRunner.run(sql)
    return Student.map_items(student_info)
  end

  def self.map_items(student_info)
    result = student_info.map { |student|
    Student.new( student ) }
    return result
  end

  def find_student_by_id()
  sql = "SELECT students.* FROM students
  WHERE students.id = $1"
  values = [@id]
  student_info = SqlRunner.run(sql, values)
  return Student.map_items(student_info)
  end
end
