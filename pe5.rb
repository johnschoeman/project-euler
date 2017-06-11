require 'byebug'
# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
#
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

def divisible
  num = 20
  loop do
    puts num
    return num if is_div_by_1to20?(num)
    num += 1
  end
end

def is_div_by_1to20?(num)
  (2..20).each do |x|
    return false if num % x != 0
  end
  true
end

if __FILE__ == $PROGRAM_NAME
  divisible
end
