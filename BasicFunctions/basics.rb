#!/usr/bin/env ruby
def helloWorld()
    puts "Hello World"
end

def sumTwo(a, b)
    return a + b
end

def checkGreaterThan(a, b) # returns 1 if greater than, 0 if equal to, -1 if less than
    return a <=> b
end

def cube(a)
    return a * a * a
end

def recursivePow(a, p)
    if(p <= 0) # edge case, shouldn't take a power less than 0
        return 1
    elsif(p == 1) 
        return a
    end
    return a * recursivePow(a, p - 1)
end


def bubbleSort(arr) 
    len = arr.size
    return arr if len <= 1

    loop do
        swap = false
        
        # using zero index base, loops over len - 1 times using the times method performed on an integer
        (len - 1).times do |i|
            if(arr[i] > arr[i + 1])
                # swap operation
                arr[i], arr[i + 1] = arr[i + 1], arr[i]
                swap = true
            end
        end

        break !swap # breaks if the swap is false, meaning that the array is fully swapped
    end

    return arr
end

def countingSort(arr) #operating by the parameters that the max will be the length of the array and the min will be 0
    aMax = arr.max + 1
    aMin = 0

    if(aMin > aMax) # such that a case there are negative numbers
        puts "Error: Min is greater than max"
    end
    
    n = aMax - aMin + 1

    # multiline comments use =begin and =end
    #=begin
    #ary = Array.new    #=> []
    #Array.new(3)       #=> [nil, nil, nil] # 3 deterines the side of the array
    #Array.new(3, true) #=> [true, true, true] # the bool value is what's placed in the every index of the array
    #=end

    count = Array.new(n, 0) # if n == 3, count => [0, 0, 0]

    len = arr.size

    result = Array.new(len) # [nil, nil, nil]

    for i in 0...len
        count[arr[i]-aMin] += 1
    end

    for i in 1...n
        count[i] += count[i-1]
    end

    for i in 0...len
        result[count[arr[i] - aMin] - 1] = arr[i]
    end

    for i in 0...len
        arr[i] = result[i]
    end

    return arr

end

def mergeSort(arr)
    # base case, check for an invalid array
    if arr.size <= 1 
        return arr
    else
        midIndex = arr.size / 2
        leftArr = mergeSort(arr.slice(0...midIndex)) # ends one before midIndex
        rightArr = mergeSort(arr.slice(midIndex...arr.size))
        mergeR(leftArr, rightArr)
    end
end

def mergeR(leftArr, rightArr)
    result = []
    
    #[].empty?
    # => true

    #{}.empty?
    # => true

    #Set.new.empty?
    # => true

    while(!leftArr.empty? && !rightArr.empty?) do
        # using shift to reallocate onto the resulting array
        # shift pops off the first value of the array and returns it

        if(leftArr[0] < rightArr[0])
            result.push(leftArr.shift)
        else
            result.push(rightArr.shift)
        end
    end

    return result.concat(leftArr).concat(rightArr) # don't quite know why we need to concat these, but it only prints the first without the concat

end

def userInputGoodies()    
    print "What's your first name? "
    first_name = gets.chomp
    first_name.capitalize!

    print "What's your last name? "
    last_name = gets.chomp
    last_name.capitalize!

    print "What's your city? "
    city = gets.chomp
    city.capitalize!

    print "What's your state? "
    state = gets.chomp
    state.upcase!

    print "You are #{first_name} #{last_name} and live at #{city}, #{state}"
    return
end

def histogram()
    puts "Insert Text to be read into the histogram: "
    text = gets.chomp
    words = text.split(" ")
    frequencies = Hash.new(0)
    words.each { |word| frequencies[word] += 1 }
    frequencies = frequencies.sort_by {|a, b| b }
    frequencies.reverse!
    frequencies.each { |word, frequency| puts word + " " + frequency.to_s }
end


def main()
    helloWorld()
    puts sumTwo(2, 4)
    puts checkGreaterThan(9, 10)
    puts checkGreaterThan(10, 9)
    puts checkGreaterThan(8, 8)
    puts true && false
    puts true || false || false
    puts cube(3)
    puts "\n"
    puts recursivePow(2, 0)
    puts recursivePow(4, 1)
    puts recursivePow(2, 4)
    puts "\n"
    puts "Sorts"
    puts "\n"
    puts "Bubble Sort"
    puts bubbleSort([11,5,7,6,15])
    puts "\n"
    puts "Counting Sort"
    puts countingSort([11,5,7,6,15])
    puts "\n"
    puts "Merge Sort"
    puts mergeSort([11,5,7,6,15])

    #userInputGoodies()

    histogram()


end

main()