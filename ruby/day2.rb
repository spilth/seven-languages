#!/usr/bin/ruby

# Print the contents of an array of sixteen numbers, four numbers at a time, using just each.
(1..16).to_a.each do |number|
  print "#{number} "
  puts if number % 4 == 0
end

# Now, do the same with each_slice in Enumerable.
(1..16).to_a.each_slice(4) do |slice|
  p slice
end

# The Tree class was interesting, but it did not allow you to specify a new tree with a clean user interface. Let the initializer accept a nested structure of hashes. You should be able to specify a tree like this: {'grandpa' => { 'dad' => {'child 1' => {}, 'child 2' => {} }, 'uncle' => {'child 3' => {}, 'child 4' => {} } } }.

class Tree
  attr_accessor :children, :node_name

  def initialize(name, children=[])
    if children.class == Hash
      @children = Tree.new(children)
    else
      @children = children
    end

    @node_name = name
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end

tree = Tree.new({'grandpa' => { 'dad' => {'child 1' => {}, 'child 2' => {} }, 'uncle' =>     {'child 3' => {}, 'child 4' => {} } } })

tree.visit_all {|node| puts node.node_name}

# Write a simple grep that will print the lines of a file having any occurrences of a phrase anywhere in that line. You will need to do a simple regular expression match and read lines from a file. (This is surprisingly simple in Ruby.) If you want, include line numbers.

file = "ruby/day2.rb"
phrase = /def visit/

puts "Searching for 'def visit' in this file..."

lines = File.readlines(file)
lines.each_with_index do |line, index|
  puts "#{index} - #{line}" if line =~ phrase
end

