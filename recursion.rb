INT_TO_ROMAN = {
  1000 => "M",
  900 => "CM",
  500 => "D",
  400 => "CD",
  100 => "C",
  90 => "XC",
  50 => "L",
  40 => "XL",
  10 => "X",
  9 => "IX",
  5 => "V",
  4 => "IV",
  1 => "I"
}

ROMAN_TO_INT = {
  "M" => 1000,
  "CM" => 900,
  "D" => 500,
  "CD" => 400,
  "C" => 100,
  "XC" => 90,
  "L" => 50,
  "XL" => 40,
  "X" => 10,
  "IX" => 9,
  "V" => 5,
  "IV" => 4,
  "I" => 1
}

def append (ary, n)
	return ary if n < 0
	ary << n
	append(ary, n-1)
end

def reverse_append (ary, n)
	return ary if n < 0
	reverse_append(ary, n-1) << n
end

def factorial(n)
	return 1 if n <= 0
	factorial(n-1) * n
end

def palindrome(n)
  return true if n.length <= 1
	n[0] == n[-1] ? palindrome(n[1..-2]) : (return false)
end

def bottles_of_beer(n)
  if n == 0
    puts "No more bottles of beer on the wall"
  else
    puts n == 1 ? "1 bottle of beer on the wall" : "#{n} bottles of beer on the wall"
    bottles_of_beer(n-1)
  end
end

def fib(n)
	return n if n == 0 || n == 1
	fib(n-1) + fib(n-2)
end

def fibs(n)
  return [0] if n <= 0
  return [0, 1] if n == 1
  result = [0, 1]
  (n-1).times {result << result[-1] + result[-2]}
  result
end

def fibs_rec(n, result = [])
  if n == 0
    [0]
  elsif n == 1
    [0, 1]
  else
    prev = fibs_rec(n-1)
    prev << (prev[-1] + prev[-2])
  end
end

def flatten_array(arr, result=[])
  arr.each do |elt|
    if elt.is_a?(Array)
      flatten_array(elt, result)
    else
      result.push(elt)
    end
  end
  result
end

def convert_int_to_roman(int, roman='')
  return roman if int == 0
  INT_TO_ROMAN.each do |key, value|
    num = (int / key).to_i
    roman += (value * num)
    return convert_int_to_roman(int - key * num, roman) if num > 0
  end
end

def convert_roman_to_int(roman, int = 0)
  return int if roman.empty?
  if ROMAN_TO_INT.include?(roman[0..1])
    int += ROMAN_TO_INT[roman[0..1]]
    convert_roman_to_int(roman[2..-1], int)
  else
    int += ROMAN_TO_INT[roman[0]]
    convert_roman_to_int(roman[1..-1], int)
  end
end


def merge_sort(arr)
  if arr.length == 1
    return arr
  else
    sort(merge_sort(arr[0..(arr.length/2-1)]), merge_sort(arr[(arr.length/2)..-1]))
  end
end

def sort(arr1, arr2, result=[])
    if arr1.empty?
      result += arr2
      return result
    elsif arr2.empty?
      result += arr1
      return result
    elsif arr1[0] < arr2[0]
      result << arr1.shift
      sort(arr1, arr2, result)
    else
      result << arr2.shift
      sort(arr1, arr2, result)
    end
end

puts "Sorted version of [1, 10, 5, 2, 8]: #{merge_sort([1, 10, 5, 2, 8])}"
puts "Sorted version of [1]: #{merge_sort([1])}"
puts "Sorted version of [2, 1]: #{merge_sort([2, 1])}"
puts "Sorted version of [4, 2, 1]: #{merge_sort([4, 2, 1])}"
puts "Sorted version of [8, 7, 3, 1, 2, 6, 8]: #{merge_sort([8, 7, 3, 1, 2, 6, 8])}"
puts
puts "Ten factorial is equal to #{factorial(10)}"
puts
puts "Is 'a' a palindrome? #{palindrome('a')}"
puts "Is 'baab' a palindrome? #{palindrome('baab')}"
puts "Is 'cat' a palindrome? #{palindrome('cat')}"
puts "Is 'racecar' a palindrome? #{palindrome('racecar')}"
puts
bottles_of_beer(10)
puts
puts "The tenth Fibonacci number is #{fib(10)}"
puts "The Fibonacci sequence up to 10 is #{fibs(10)}"
puts "The Fibonacci sequence up to 10 is #{fibs_rec(10)}"
puts
puts "The flattened version of [[1, 2], [3, 4]] is #{flatten_array([[1, 2], [3, 4]]).inspect}"
puts "The flattened version of [[1, [8, 9]], [3, 4]] is #{flatten_array([[1, [8, 9]], [3, 4]]).inspect}"
puts
puts "The Roman number version of 1234 is #{convert_int_to_roman(1234)}"
puts
puts "The integer version of MCCXXXIV is #{convert_roman_to_int('MCCXXXIV')}"
