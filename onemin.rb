#!/usr/bin/env ruby
require 'optparse'

options = {
  :time => 60
}
OptionParser.new do |opts|
  opts.banner = "Usage: onemin.rb [options]"

  opts.on("-t", "--time", "Time to run, in seconds") do |t|
    options[:time] = t
  end
end.parse!

def main(opts)
  exercises = []
  Dir.new("./src/exercises").each do |s|
    if not s.match /(.swo|.swp)$/ and s != "." and s != ".."
      exercises.push s
    end

  end

  puts "Choose an exercise:"
  exercises.each_with_index { |e,i| puts "#{i}. #{e[0...-3]}" }

  c = ARGF.readline.strip.to_i
  require "./src/exercises/#{exercises[c]}"

  run
end

def run()
  e = OneMin::Exercise.new
  e.configure

end
main(options)
