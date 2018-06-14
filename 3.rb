

#Time complexity is O(da) where d = is amount of coins we have for change, and a is target amount
# Space complexity is O(da) as well
#It is possible to do this faster in a one dimensional array that only keeps a reference to the last row
#however I find this 2D array more explicit and helpful to visualize the dynammic programming



def change_possibilities(denominations, amount)
    return 0 if (amount == 0) || (denominations.length == 0)
    results = Array.new(denominations.length){Array.new(amount)}
      (0...denominations.length).each do |y|
        (0..amount).each do |x|
          if(y == 0)
              results[y][x] = 1
          elsif denominations[y] > x
            results[y][x] = results[y-1][x]
          else
            results[y][x] = results[y-1][x] + results[y][x-denominations[y]]
          end
        end
      end
  results[-1][-1]
end
