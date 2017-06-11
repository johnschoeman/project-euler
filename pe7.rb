require 'byebug'
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
#
# What is the 10 001st prime number?

def isp?(num)
  return false if num < 2
  (2..Math.sqrt(num)).each do |n|
    return false if num % n == 0
  end
  true
end

def nextp(num)
  num += 2
  loop do
    return num if isp?(num)
    num += 2
  end
end

def findprime
  # byebug
  count = 2
  prime = 3
  until count == 10001
    prime = nextp(prime)
    count += 1
    puts "count: #{count} prime: #{prime}"
  end
  prime
end

findprime
