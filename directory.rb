@students = [] # an empty array accessible to all methods

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def process(selection)
    case selection
      when "1"
        input_students
      when "2"
        show_students
      when "3"
        save_students
      when "9"
        exit
      else
        puts "I don't know what you meant, try again"
    end
  end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def input_students
  puts "Please enter the names of the students and their cohort"
  puts "To finish, just hit return twice"
  # create empty array
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # get their cohort
    cohort = "november"
    puts "please enter the student's cohort"
    cohort = gets.chomp
    @students << {name: name, cohort: cohort}
    puts "Now we have #{@students.count} students"
    puts "Enter the next student"
    # get another name from the user
    name = gets.chomp
  end
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print_students_list
  if @students.count >= 1
    @students.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer
  if @students.count != 1
    puts "Overall, we have #{@students.count} great students"
  elsif @students.count == 1
    puts "Overall, we have #{@students.count} great student"
  end
end
# call methods
interactive_menu
