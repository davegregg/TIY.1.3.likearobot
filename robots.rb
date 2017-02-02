#!/usr/bin/env ruby
require 'pry'
class Robot
  attr_accessor :name, :say_hi, :say_name, :height

  def initialize
    @name = name
    @height = 10
  end

  def say_hi
    "Hi!"
  end

  def say_name
    "My name is " + self.name
  end

  def self.descendants #src: https://stackoverflow.com/questions/2393697/look-up-all-descendants-of-a-class-in-ruby
    ObjectSpace.each_object(Class).select { |klass| klass <= self }
  end

  def method_missing(methd)
    puts "ERRRORRR! HUMAN DETECTED!! '#{methd}' attempted!"
  end
end

class BendingUnit < Robot
  def bend(objecttobend)
    "Bend #{objecttobend}!"
  end
end

class ActorUnit < Robot
  def change_name(newname)
    self.name = newname
  end
end

def biofacture(flesh_herd)
  collective = []
  flesh_herd.each_with_index do |flesh_unit,index|
    collective[index] = Robot.descendants.sort_by{ rand }[0].new
    collective[index].name = flesh_unit
  end
  collective
end

robotbot = Robot.new
robotbot.name = "Tank"
bender = BendingUnit.new
bender.name = "Seymour"
actorbot = ActorUnit.new
actorbot.name = "Aviendha"

flesh_herd = ['Dave McKinney','David Gregg','Demetra Koras','Kalea Wolff','Kendrick Lo','Laura Moore','Phil Shaughnessy','Ben Call','Collin Schneider','Michael Stashevsky','Miguel Soria','Nancy Ingels']
borg = biofacture(flesh_herd)

puts "\n\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#"
puts "\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\n\n"

puts "Try 'borg[0].say_name' and borg[0].class. Result: #{borg[0].say_name} and I'm a #{borg[0].class}!\n\n"

puts "\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#"
puts "\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\n"

binding.pry
