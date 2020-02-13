@students = []

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "Students Saved to students.csv"
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    load_students()
  elsif File.exists?(filename)
    load_students(filename)
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def add_to_student_array(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
      add_to_student_array(name, cohort)
    end
    file.close
    puts "Loaded #{@students.count} students from #{filename}"
  end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
    case selection
      when "1"
        puts "Input Students"
        input_students
      when "2"
        puts "Show Students"
        show_students
      when "3"
        puts "Save Students"
        save_students
      when "4"
        puts "Load Students"
        load_students
      when "9"
        puts "Exit"
        exit
      else
        puts "I don't know what you meant, try again"
    end
  end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
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
  name = STDIN.gets.chomp
  while !name.empty? do
    cohort = "november"
    puts "please enter the student's cohort"
    if !name.empty?
      cohort = STDIN.gets.chomp
    end
    add_to_student_array(name, cohort)
    puts "Now we have #{@students.count} students"
    puts "Enter the next student"
    name = gets.chomp
  end
  "End of student input"
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
  else
    puts "Overall, we have #{@students.count} great student"
  end
end
# call methods
try_load_students
interactive_menu
