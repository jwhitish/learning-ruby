#must buy before sell
#return best day pair for max profit


def stock_picker(array)
  best_buy = 0
  best_sell = 0
  max_profit = 0

  #first iterate through the array to find a buy day
  (0..(array.length-2)).each do |buy_date|

    #for each possible buy day, iterate through each sell day
    ((buy_date + 1)..array.length - 1).each do |sell_date|

    #check the price difference for those two days
      price_difference = array[sell_date] - array[buy_date]

    #if price diff is larger than the current max profit, store those days and max profit
      if price_difference > max_profit
        best_buy = buy_date
        best_sell = sell_date
        max_profit = price_difference
      end
    end
  end
  puts "day #{best_buy}: buy at #{array[best_buy]}"
  puts "day #{best_sell}: sell at #{array[best_sell]}"
  puts "profit of #{max_profit}"

  return [best_buy, best_sell]
end




stock_picker([17,3,6,9,15,8,6,1,10])
#answer [1,4] : $15 - $3 = $12
