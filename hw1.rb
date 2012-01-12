train         = ARGV[1] || "optdigits.training"
test          = ARGV[2] || "optdigits.testing"
learning_rate = ARGV[3] || 0.2

require 'Perceptron'

p = Perceptron.new(train, test, learning_rate)
p.train(10)
