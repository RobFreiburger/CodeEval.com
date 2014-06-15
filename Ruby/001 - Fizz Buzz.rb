test_cases = []
open(ARGV[0]) do |f|
  while (line = f.gets)
    line.match(/(\d+) (\d+) (\d+)/) do |m|
      test_cases.push([m[1].to_i, m[2].to_i, m[3].to_i])
    end
  end
end

results = []
test_cases.each do |t|
  result = []
  fizz, buzz, n = t[0], t[1], t[2]
  
  (1..n).each do |i|
    if ((i % fizz == 0)|| (i % buzz == 0))
      string = ''
      string += 'F' if i % fizz == 0
      string += 'B' if i % buzz == 0
      result << string
    else
      result << i
    end
  end
  
  results << result
end

results.each do |r|
  puts r.join(" ")
end