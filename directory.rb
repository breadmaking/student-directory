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
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp

  # while the name is not empty, repeat this code
  while !name.empty? do
    hobbies = input_hobbies
    puts 'Where was the student born?'
    birthplace = gets.chomp
    puts 'How old is the student?'
    age = gets.chomp
    # add the student hash to the array
    students << {name: name, cohort: :november, hobbies: hobbies, birthplace: birthplace, age: age}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
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
  puts "Overall, we have #{students.count} great students"
end

students = input_students
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)