# Solution influenced by https://gist.github.com/anymd/8450736
# Make basic Bridge class for easier data management
class Bridge
  def initialize(pointA, pointB, name)
    @pointA_X, @pointA_Y = pointA[0].to_f, pointA[1].to_f
    @pointB_X, @pointB_Y = pointB[0].to_f, pointB[1].to_f
    @name = name
  end
  
  def slope
    (@pointB_Y - @pointA_Y) / (@pointB_X - @pointA_X)
  end
  
  def horizontal_intercept
    @pointA_Y - self.slope * @pointA_X
  end
  
  def name
    "#{@name}"
  end
  
  # Example output: "1: ([37.788353, -122.387695], [37.829853, -122.294312])"
  def to_s
    "#{@name}: ([#{@pointA_X}, #{@pointA_Y}], [#{@pointB_X}, #{@pointB_Y}])"
  end
end

# Input data
test_cases = []
open(ARGV[0]) do |f|
  while (line = f.gets)
    points = []
    line.scan(/(-?\d*\.\d*)/) do |m|
      points << m[0].to_f
    end
    test_cases << [points[0..1], points[2..3]]
  end
end