#!/usr/bin/ruby

# Print the string "Hello, world"
puts "Hello, world"

# For the string “Hello, Ruby,” find the index of the word “Ruby.”
puts "Hello, Ruby".index("Ruby")

# Print your name ten times.
10.times { puts "Brian" }

# Print the string “This is sentence number 1,” where the number 1 changes from 1 to 10.

(1..10).each { |number| puts "This is sentence number #{number}" }

# Run a Ruby program from a file.
# ruby day1.rb

number = rand(10) + 1
turns = 0

puts "I'm thinking of a number between 1 and 10..."

begin
  print "What's your guess? "
  guess = gets.to_i

  if guess < number
    puts "Too low!"
  end

  if guess > number
    puts "Too high!"
  end
  
  if guess == number
    puts "Correct!"
  end

  turns += 1
end while (guess != number)

puts "It took you #{turns} turns to guess the number."

