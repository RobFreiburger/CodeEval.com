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

