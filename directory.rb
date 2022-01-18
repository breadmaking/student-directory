def print_header
  puts "The students of Villains Academy".center(75,'---')
  puts "-------------".center(75,'---')
end

def print(students)
  count = 0
  while students.count != count
    students.each.with_index(1) do |student, index|
      puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort). Hobbies: #{student[:hobbies].join(', ')}. Birthplace: #{student[:birthplace]}. Age: #{student[:age]}."
      count += 1
    end
  end
end

def print_footer(students)
  if students.count == 1
    puts "Overall, we have #{students.count} great student"
  else
    puts "Overall, we have #{students.count} great students"
  end
end

def input_hobbies
  puts "Please enter the students hobbies"
  puts "To finish, just hit return twice"
  hobbies = []
  hobby = gets.chomp
  while !hobby.empty? do
    hobbies << hobby
    puts "#{hobby} added. #{hobbies.count} in total."
    hobby = gets.chomp
  end
  return hobbies
end

def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp

  # while the name is not empty, repeat this code
  while !name.empty? do
    puts 'What cohort is the student in?'
    cohort = gets.chomp
    cohort = 'Empty' if cohort.empty?

    hobbies = input_hobbies
    hobbies = ['Empty'] if hobbies.count == 0

    puts 'Where was the student born?'
    birthplace = gets.chomp
    birthplace = 'Empty' if birthplace.empty?

    puts 'How old is the student?'
    age = gets.chomp
    age = 'Empty' if age.empty?

    puts "Name: #{name} - Cohort: #{cohort} - Hobbies: #{hobbies.join(', ')} - Birthplace: #{birthplace} - Age: #{age}."
    puts "Check for Typos - confirm with Y or N"
    correct = gets.chomp

    answer_given = false
    until answer_given != false
      if correct.downcase == 'y'
        # add the student hash to the array
        students << {name: name, cohort: cohort.to_sym, hobbies: hobbies, birthplace: birthplace, age: age}
        print_footer(students)
        puts "Please enter the name of the student"
        puts "To finish, just hit return twice"
        answer_given = true
      elsif correct.downcase == 'n'
        puts "Please re-enter the data"
        puts "Please re-enter the name of the student"
        puts "To finish, just hit return twice"
        answer_given = true
      else
        puts "I didn't get that please put Y or N"
        correct = gets.chomp
      end
    end
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

students = input_students
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)