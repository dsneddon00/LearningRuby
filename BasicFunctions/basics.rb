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

        break !swap
    end

    return arr
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
    puts bubbleSort([11,5,7,6,15])
end

main()