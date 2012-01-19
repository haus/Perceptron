train         = ARGV[1] || "optdigits.training"
test          = ARGV[2] || "optdigits.testing"
learning_rate = ARGV[3] || 0.1
number        = ARGV[4] || 8

require 'Perceptron'
(0..9).reject{|i| i == number}.each do | i |
  puts "Run for #{number} vs. #{i}"
  puts "=========================="
  p = Perceptron.new(train, test, learning_rate, i, number).train
  puts "End of run....."
  puts
end
