

def sortByStrings(s,t)
    s_char_frequency = Hash.new(0)
    result = ""
    s.each_char {|c| s_char_frequency[c] += 1}
    t.each_char do |c|
        c_frequency = s_char_frequency[c]
      if c_frequency > 0
        result << c * c_frequency
        s_char_frequency[c] = 0
      end
    end

    s_char_frequency.each do |k,v|
      result << k*v if v > 0
    end
    #this covers edge case where S has characters that are not in T

  result
end

#Runtime complexity is O(s.length + t.length)
#Space Complexity is O(1) as we create a hash, and a second string
#Note, strings are mutable in Ruby, so the result << c operation does not
#create a second string, which allows us to keep space complexity to O(1)
