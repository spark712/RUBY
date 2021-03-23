def bubble_sort(arr)
  (arr.length).times do
    for i in (0..arr.length-1)
      if arr[i+1] == nil
        break
      else
        if arr[i] > arr[i+1]
          cons = arr[i]
          arr[i] = arr[i+1]
          arr[i+1] = cons
        end
      end
    end
  end
  p arr
end

bubble_sort([4,3,78,2,0,2,1,45])