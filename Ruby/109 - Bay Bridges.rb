# Solution influenced by https://gist.github.com/anymd/8450736
# Make basic Bridge class for easier data management
class Bridge
  def initialize(pointA, pointB, name)
    @pointA_X, @pointA_Y = pointA[0], pointA[1]
    @pointB_X, @pointB_Y = pointB[0], pointB[1]
    @name = name
  end
  
  def slope
    (@pointB_Y - @pointA_Y) / (@pointB_X - @pointA_X)
  end
  
  def horizontal_intercept
    @pointA_Y - self.slope * @pointA_X
  end
  
  def name
    @name.to_s
  end
  
  # Example output: "1: ([37.788353, -122.387695], [37.829853, -122.294312])"
  def to_s
    "#{@name}: ([#{@pointA_X}, #{@pointA_Y}], [#{@pointB_X}, #{@pointB_Y}])"
  end
end

# Input data
input_data = []
open(ARGV[0]).each_line do |line|
  points = []
  name = ""
  
  # name
  line.match(/\A(\d+):/) { |match| name = match[0] }
  
  # points
  line.scan(/(-?\d*\.\d*)/) do |match|
    points << match[0].to_f
  end
  
  input_data << Bridge.new(points[0..1], points[2..3], name)
end