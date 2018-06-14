#Time complexity is O(n) where n is the length of the string
#Space Complexity is O(n)

def decode_string(s)
  number_stack = []
  str_stack = []
  numbers = {}
  (0..10).to_a.each{|num| numbers[num.to_s] = true}
  i = 0
  number = ""
  while i < s.length
    if numbers[s[i]]
      number += s[i]
      if numbers[s[i+1]]
      else
        number_stack.push(number.to_i)
        number = ""
      end
     elsif s[i] == "]"
      to_add = ""
      until str_stack[-1] == "["
       to_add += str_stack.pop
      end
      str_stack.pop
      str_stack.push(to_add * number_stack.pop)
    else
      str_stack.push(s[i])
    end
    i += 1
  end
  result = ""
  str_stack.each do |word|
    result += word.reverse
  end
  result
end

#You can also implement this recursively, however I find it easier to outline and
#visualize the logic iteratively
