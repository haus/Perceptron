class Perceptron
  attr_accessor :weights, :learning_rate, :training_set, :testing_set
  def initialize(train_file, test_file, learning_rate)
    random = Random.new(1234)

    @training_set = Array.new(10).map! { | i | Array.new }
    @testing_set = Array.new(10).map!  { | i | Array.new }

    load_data(train_file, @training_set)
    load_data(test_file, @testing_set)

    # Num nodes
    num_nodes = @training_set.first.first.size+1

    # Initialize weights
    @weights = Array.new(65)
    @weights.collect! { | i | random.rand(-1.0..1.0) }
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

  def train
    
  end

end
