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

def first_anagrams?(str1,str2)
     anagrams= str1.split("").permutation.to_a

    anagrams.join("").include?(str2)
    #time complexity is factorial O(n!)
   
end
# p first_anagrams?("gizmo", "sally")    #=> false
# p first_anagrams?("elvis", "lives")    #=> true

def second_anagrams?(str1,str2)

  str1.each_char.with_index do |char,i|
   str2.delete!(char) if str2.include?(char)
    
  end
#time complexity is quadratic =O(n^3)
 str2.empty?
end
# p second_anagrams?("gizmo", "sally")    #=> false
# p second_anagrams?("elvis", "lives")    #=> true
# -------------------------------------------
def third_anagrams?(str1,str2)
    str.sort == str2.sort
    # time complexity is linearithmic O(n log n)
end
# p second_anagrams?("gizmo", "sally")    #=> false
# p second_anagrams?("elvis", "lives")    #=> true
# ------------------------------------------------
def fourth_anagrams?(str1,str2)
   hash=Hash.new(0)
   
   str1.each_char {|c| hash[c]+=1}
   str2.each_char {|c| hash[c]-=1}
   hash.values.sum == 0
end
# p second_anagrams?("gizmo", "sally")    #=> false
# p second_anagrams?("elvis", "lives")    #=> true


def bad_two_sum?(arr, target_sum) 

    arr.each_with_index do |ele1, i1|
        arr.each_with_index do |ele2, i2|
            if i2 > i1 && ele1 + ele2 == target_sum
                return true
            end
        end

    end
    false
end
def ok_two_sum?(arr, target_sum) 

    sorted=arr.sort
    mid_index=sorted.length / 2
    i = 0
    hit = false 
    while i < arr.length
        # p "stuck in a loop"
        if sorted[i] > (target_sum / 2) && !hit
            i1 = i - 1
            i2 = i
            hit = true
            
        end
        i += 1
    end
    # i1=mid_index
    # i2=i1+1

    # p sorted[i1] 
    # p sorted[i2]
    sorted_check = false
    while !sorted_check
        case sorted[i1] + sorted[i2] <=> target_sum
        when 0 
            return true
        when 1
            p "left"
            p sorted[i1] + sorted[i2]
            i1-=1
            return false if i1 == 0
        when -1
            p "right"
            i2+=1      
            return false if i2 == arr.lenght 
        end
    end
    return false
    # time complexity is linearithmic O(n log n)
end

arr = [1,3,5,1000,1500,2000,2500,5000000]
p ok_two_sum?(arr, 6) # => should be true
p ok_two_sum?(arr, 10) # => should be false


def two_sum?(arr, target)
    hash = {} 
    arr.each do |n|
        value = target - n
     if hash.has_key?(value)
        return true
     else
        hash[n]=value
     end
    end
    false
     # time complexity is linear O(n)
end

# arr = [0, 1, 5, 7]
# p two_sum?(arr, 6) # => should be true
# p two_sum?(arr, 10) # => should be false
# # ------------------------------------------------