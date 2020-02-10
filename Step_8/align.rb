def input_students
  puts "Please enter the names of the students".center(45)
  puts "To finish, just hit return twice".center(45)
  # create empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students".center(45)
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  45
  head_1 = "The students of my cohort at Makers Academy"
  head_2 = "-------------"

  puts head_1.center(45)
  puts head_2.center(45)
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center(45)
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(45)
end
# call methods
students = input_students
print_header
print(students)
print_footer(students)
