def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def sort_letter
  puts "Please enter the letter you wish to search"
  letter = gets.chomp
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print(students,letter)
  students.each do |student|
    if student[:name][0] == letter
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
# call methods
students = input_students
letter = sort_letter
print_header
print(students,letter)
print_footer(students)
