require('pry')

require_relative('../models/student')


student1 = Student.new({
  "first_name" => "Euan",
  "last_name"  => "Bell",
  "house_name" => "Ravenclaw",
  "age" => 25
  })
student1.save

student2 = Student.new({
  "first_name" => "Hamish",
  "last_name"  => "Hoad",
  "house_name" => "Ravenclaw",
  "age" => 35
  })
student2.save

student3 = Student.new({
  "first_name" => "Matilda",
  "last_name"  => "Smith",
  "house_name" => "Sliveryn",
  "age" => 21
  })
student3.save


binding.pry
nil
