class Perceptron
  # List of instance variables that need accessor methods created
  attr_accessor :weights, :learning_rate, :training_set, :testing_set, :epochs

  # Constructor for the Perceptron, takes training and testing files and learning rate as arguments
  def initialize(train_file, test_file, learning_rate)
    random = Random.new(1234)

    # Arrays of 10 for each of the 10 digits
    @training_set = Array.new(10).map! { | i | Array.new }
    @testing_set = Array.new(10).map!  { | i | Array.new }

    # Populate the arrays
    load_data(train_file, @training_set)
    load_data(test_file, @testing_set)

    # Num nodes (number of attributes plus the bias node)
    num_nodes = @training_set.first.first.size+1

    # Initialize weights
    @weights = Array.new(num_nodes)
    @weights.collect! { | i | random.rand(-1.0..1.0) }

    # Initialize epochs to 0
    @epochs = 0
  end

  def load_data(file, array)
    count = 0
    File.open(file).readlines.each do | line |
      count += 1
      cur_line = line.chomp!.split(',')
      index = cur_line.pop.to_i
      if array[index].nil?
        array[index] = Array.new(1, cur_line)
      else
        array[index] << cur_line
      end
    end
  end

  def update_weights

  end

  def test

  end

  # Training takes an optional duration argument for # of epochs to train.
  def train (duration = nil)
    #unless duration.nil?
  end

end
