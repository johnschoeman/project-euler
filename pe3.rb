require 'byebug'
# The prime factors of 13195 are 5, 7, 13 and 29.
#
# What is the largest prime factor of the number 600851475143 ?
def prime_factors(input)
  num, factors = small_primes(input)
  big_primes(input, num, factors).sort
end

def small_primes(num)
  factors = []
  primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281, 283, 293, 307, 311, 313, 317, 331, 337, 347, 349, 353, 359, 367, 373, 379, 383, 389, 397, 401, 409, 419, 421, 431, 433, 439, 443, 449, 457, 461, 463, 467, 479, 487, 491, 499, 503, 509, 521, 523, 541, 547, 557, 563]
  primes.each do |prime|
    return [num, factors] if num < 2 || prime > num
    if num % prime == 0
      factors << prime
      num /= prime
    end
  end
  [num, factors]
end

def big_primes(input, num, factors)
  factor = prevprime(Math.sqrt(input).to_i)
  loop do
    if num % factor == 0
      factors << factor
      num /= factor
    end
    factor = prevprime(factor)
    break if factor <= 563
    break if num < 2 || factor > num
  end
  factors
end

def isprime?(num)
  return false if num == 1
  (2..Math.sqrt(num)).each do |x|
    return false if num % x == 0
  end
  true
end

def nextprime(num)
  prime = num.to_i + 1
  return prime if isprime?(prime)
  loop do
    prime += 1
    return prime if isprime?(prime)
  end
end

def prevprime(num)
  prime = num.to_i - 1
  return prime if isprime?(prime)
  loop do
    prime -= 1
    return prime if isprime?(prime)
    break if prime < 2
  end
end

if __FILE__ == $PROGRAM_NAME
  num = 600851475143
  print prime_factors(num)
end
