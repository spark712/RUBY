def stock_picker(arr)
    arr_1 = arr
    arr_2 = arr
    arr_f = []
    arr_1.each_with_index do |n1, i1|
        arr_2.each_with_index do |n2, i2|
            if i2 <= i1
                next
            else
                x = arr_2.reduce() do |co, n|
                    co = "#{n2 - n1},#{i1},#{i2}"
                end
                arr_f << [x]
            end
        end
    end
    #p arr_f
    max_profit_set = arr_f.reduce(['0,0']) do |largest, current|
        largest = (largest.first.split(",").first.to_i) > (current.first.split(",").first.to_i) ? largest : current
    end
    #p max_profit_set
    p reduced_result(max_profit_set)    
end

def reduced_result(res)
  reduced =  res.first.split(',')
  reduced.shift
  final_set = reduced.map do |day|
        day.to_i
  end
  return final_set
end

stock_picker([17,3,6,9,15,8,6,1,10])
stock_picker([10,3,6,9,2,15,8,16,1,10])