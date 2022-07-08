def my_min(array)
     min=array.first
    array.each {|ele| min = ele if ele < min}
    min
    #time complexity is linear =O(n)
end

def my_min_2(array)
    min=array.first
    array.each_with_index do |ele1,i1|
        if array.all? {|ele2| ele1 <= ele2}
            min =ele1
          

        end
    end
  min
     #time complexity is quadratic =O(n^2)
end


# p my_min([1,2,3])
# p my_min_2([1,2,3])
# ---------------------------------------

def largest_contiguous_subsum(list)
    sub_sum = []
    max_sum = []

    list.each_with_index do |ele1, i1| 
        list.each_with_index do |ele2, i2|
            if i2 >= i1 
                sub_sum << list[i1 .. i2]
            end
        end
    end
    sub_sum.each do |sub|
        max_sum << sub.sum 
    end
    max_sum.max
    #time complexity is quadratic =O(n^2)
end

# p largest_contiguous_subsum([5, 3, -7])
# p largest_contiguous_subsum([2, 3, -6, 7, -6, 7])
# p largest_contiguous_subsum([-5, -1, -3])

def largest_contiguous_subsum_2(list)
    # sorted_list = list.sort.reverse
    # p sorted_list
    largest_sum = list.first # 5
    current_sum = list.first # 5 
    i = 1

    while i < list.length 
        # current_sum += list[i] #5
        if current_sum < 0
            current_sum = list[i]
            largest_sum = current_sum if largest_sum < current_sum
            i += 1
        else
            current_sum += list[i]
            largest_sum = current_sum if largest_sum < current_sum
            i += 1
        end
    end
    largest_sum
    # current_sum = list.first + list[1]
    
    # (0 ... list.length - 1) do |i| 
    #     run_sum = list[i] + list[i + 1]
    #     if run_sum < current_sum
    #         current_sum = run_sum
    #     end   

    # end
    # current_sum
end


# p largest_contiguous_subsum_2([5, 3, -7])
# p largest_contiguous_subsum_2([2, 3, -6, 7, -6, 7])
# p largest_contiguous_subsum_2([-5, -1, -3])