# Basic Perceptron using Stochastic Descent
class Perceptron
  # List of instance variables that need accessor methods created
  attr_accessor :weights, :learning_rate, :training_set, :testing_set, :epochs, :num

  # Constructor for the Perceptron, takes training file and testing file and learning rate as arguments
  def initialize(train_file, test_file, learning_rate, num1, num2)
    @learning_rate = learning_rate
    random = Random.new(1234)

    # Variable to hold the training and testing data
    @training_set = Array.new(0)
    @testing_set = Array.new(0)

    # Populate the arrays
    load_data(train_file, @training_set)
    load_data(test_file, @testing_set)

    # Num nodes (number of attributes plus the bias node)
    num_nodes = @training_set.first.size-1

    # Initialize weights
    @weights = Array.new(num_nodes)
    @weights.collect! { | i | random.rand(-1.0..1.0) }

    # Initialize epochs to 0
    @epochs = 1
    @num1 = num1
    @num2 = num2
  end

  private

  # Load data from files into the array
  def load_data(file, array)
    File.open(file).readlines.each do | line |
      cur_line = line.chomp!.split(',').unshift("1")
      #puts "Wrong size in file." && exit unless cur_line.size == 66
      cur_line.map! { | elem | elem.to_i }
      array << cur_line
    end
  end

  # After each training element is processed, the weights should be updated
  def update_weights(elems, target, output)
    adjustment = @learning_rate * (target - output)
    @weights.map!.each_with_index do | weight, i |
      weight += adjustment * elems[i]
    end
  end

public
  # Test the trained perceptron against the testing data.
  def test

  end

  # Training takes an optional duration argument for # of epochs to train.
  def train (duration = nil)
    # Trying to recognize 8, so 8 is 1, other is -1
    if duration.nil?
      while do_train(@epochs) != 100
        @epochs += 1
      end
    else
      1.upto(duration) do | i |
        do_train(i)
      end
    end
  end

  # This abstracts the meat of train so train can operate 
  # on a set # of epochs or until 100% is reached
  def do_train(i)
    puts "Epoch ##{i}"
    puts "============="
    count = 0
    correct = 0

    # Calculate the activation
    @training_set.each do | example |
      # Set the target
      answer = example.last
      next unless (answer == @num1 || answer == @num2)
      target = (answer == @num1 ? 1 : -1)

      # Initialize sum to 0
      sum = 0
      example.each_with_index do | elem, j |
        next if j == example.size-1
        sum += (elem * @weights[j])
      end

      output = ( sum <= 0 ? -1 : 1 )

      # Update the weights if appropriate
      if output == target then
        correct += 1
      else
        update_weights(example, target, output)
      end
      count += 1
    end

    accuracy = correct.to_f/count.to_f * 100

    puts "Correct: #{correct}"
    puts "Incorrect: #{count - correct}"
    puts "Accuracy: #{accuracy}%"
    puts

    accuracy
  end

end
