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

def sortNumsWithDefaultParam(arr, rev=false)
    arr.sort!
    if rev
        return arr.reverse!
    else
        return arr
    end
end

def alphabetize(arr, rev=false)
    if rev
        arr.sort { |item1, item2| item2 <=> item1 }
    else
        arr.sort { |item1, item2| item1 <=> item2 }
    end
end


def movieLog(movies, choice)
    case choice
    when 'add'
      #puts "Movie name to add?"
      puts "What movie do you want to add?"
      title = gets.chomp
      if movies[title.to_sym].nil?
        puts "What's the rating? (Type a number 0 to 5.)"
        rating = gets.chomp
        movies[title.to_sym] = rating.to_i # to_i is to integer
        puts "#{title} has been added with a rating of #{rating}."
      else
        puts "That movie already exists! Its rating is #{movies[title.to_sym]}."
      end
    when 'update'
      puts "What movie do you want to update?"
      title = gets.chomp
      if movies[title.to_sym].nil?
        puts "Movie not found!"
      else
        puts "What's the new rating? (Type a number 0 to 4.)"
        rating = gets.chomp
        movies[title.to_sym] = rating.to_i
        puts "#{title} has been updated with new rating of #{rating}."
      end
    when 'display'
      movies.each do |movie, rating|
        puts "#{movie}: #{rating}"
      end
    when 'delete'
      puts "What movie do you want to delete?"
      title = gets.chomp
      if movies[title.to_sym].nil?
        puts "Movie not found!"
      else
        movies.delete(title.to_sym)
        puts "#{title} has been removed."
      end
    else
      puts "Error!"
    end
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

    #histogram()
    puts "\n"
    numbers = [1, 3, 4, 5, 3]
    print sortNumsWithDefaultParam(numbers, true)

    puts "\n"
    books = ["Heart of Darkness", "Code Complete", "The Lorax", "The Prophet", "Absalom, Absalom!", "Chronicles of Bones and Steel", "Horra Patter"]
    print alphabetize(books)
    puts "\n"
    print alphabetize(books, true)

    puts "\n"

    movies = {
        "Saw 6".to_sym => 3,
        "Toast Warrior".to_sym => 4,
        "Us".to_sym => 1
    }

    puts "Enter an option:"
    puts "-> Type 'add' to add a movie."
    puts "-> Type 'update' to update a movie."
    puts "-> Type 'display' to display all movies."
    puts "-> Type 'delete' to delete a movie."
    choice = gets.chomp.downcase

    movieLog(movies, choice)
end

main()