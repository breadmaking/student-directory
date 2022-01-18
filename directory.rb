@students = []

def print_header
  puts "The students of Villains Academy".center(75,'---')
  puts "-------------".center(75,'---')
end

def print
  if @students.count != 0
    all_cohorts = []

    @students.each do |student|
      all_cohorts << student[:cohort].capitalize
    end

    all_cohorts = all_cohorts.uniq

    all_cohorts.each do |cohort|
      puts "Cohort: #{cohort}"
      @students.each do |student|
        if student[:cohort].capitalize == cohort
          puts "#{student[:name]}. Hobbies: #{student[:hobbies].join(', ')}. Birthplace: #{student[:birthplace]}. Age: #{student[:age]}."
        end
      end
    end
  end
end

def print_footer
  if @students.count >= 1
    puts "Overall, we have #{@students.count} great student"
  else
    puts "We have #{@students.count} students"
  end
end

def input_hobbies
  puts "Please enter the students hobbies"
  puts "To finish, just hit return twice"
  hobbies = []
  hobby = STDIN.gets.chomp
  while !hobby.empty? do
    hobbies << hobby
    puts "#{hobby} added. #{hobbies.count} in total."
    hobby = STDIN.gets.chomp
  end
  return hobbies
end

def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  # create an empty 
  # get the first name
  name = STDIN.gets.chomp

  # while the name is not empty, repeat this code
  while !name.empty? do
    puts 'What cohort is the student in?'
    cohort = STDIN.gets.chomp
    cohort = 'Empty' if cohort.empty?

    hobbies = input_hobbies
    hobbies = ['Empty'] if hobbies.count == 0

    puts 'Where was the student born?'
    birthplace = STDIN.gets.chomp
    birthplace = 'Empty' if birthplace.empty?

    puts 'How old is the student?'
    age = STDIN.gets.chomp
    age = 'Empty' if age.empty?

    puts "Name: #{name} - Cohort: #{cohort} - Hobbies: #{hobbies.join(', ')} - Birthplace: #{birthplace} - Age: #{age}."
    puts "Check for Typos - confirm with Y or N"
    
    loop do
      correct = STDIN.gets.chomp
    
      case correct.downcase
        when "y"
          @students << {name: name, cohort: cohort.to_sym, hobbies: hobbies, birthplace: birthplace, age: age}
          print_footer
          puts "Please enter the name of the student"
          puts "To finish, just hit return twice"
          break
        when "n"
          puts "Please re-enter the data"
          puts "Please re-enter the name of the student"
          puts "To finish, just hit return twice"
          break
        else
          puts "I didn't get that please put Y or N"
      end
    end
    # get another name from the user
    name = STDIN.gets.chomp
  end
  # return the array of students
  @students
end

def show_students1
  
  print_header
  print
  print_footer
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save Students to CSV"
  puts "4. Load Students from CSV"
  puts "9. Exit" # 9 because we'll be adding more items
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
      hobbies = ''
      student[:hobbies].each do |hobby|
        hobbies += "\ #{hobby}"
      end
    student_data = [student[:name], student[:cohort], hobbies, student[:birthplace], student[:age]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort, hobbies, birthplace, age = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym, hobbies: hobbies.split(" "), birthplace: birthplace, age: age}
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end


def interactive_menu
  loop do
    #1. print menu options and as user for input
    print_menu
    #2. read input and save to varibale
    process(STDIN.gets.chomp)
    #3. carry out request
  end
end


interactive_menu