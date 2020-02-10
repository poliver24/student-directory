def input_students
  puts "Please enter the names of the students and their cohort"
  puts "To finish, just hit return twice"
  # create empty array
  students = []
  # get the first name
  name = gets.gsub("\n","")
  # while the name is not empty, repeat this code
  while !name.empty? do
    # get their cohort
    cohort = "november"
    puts "please enter the student's cohort"
    cohort = gets.chomp
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students"
    puts "Enter the next student"
    # get another name from the user
    name = gets.gsub("\n","")
  end
  # return the array of students
  students.sort_by! { |student| [student[:name], student[:cohort]] }
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  if names.count != 1
    puts "Overall, we have #{names.count} great students"
  elsif names.count == 1
    puts "Overall, we have #{names.count} great student"
  end
end
# call methods
students = input_students
print_header
print(students)
print_footer(students)
