require 'byebug'
# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
#
# Find the largest palindrome made from the product of two 3-digit numbers.

def largest_palindrome
  palindromes = []
  999.downto(100).each do |x|
    999.downto(100).each do |y|
      product = x * y
      palindromes << product if is_palindrome?(product)
    end
  end
  palindromes.max
end

def is_palindrome?(num)
  num.to_s.reverse == num.to_s
end

if __FILE__ == $PROGRAM_NAME
  puts largest_palindrome
end
